/* Name: Jason Arce
 * x500: arcex012
 * File:        csim.c
 * Description: A cache simulator that can replay traces from Valgrind and
 *              output statistics such as number of hits, misses, and evictions
 *              The replacement policy is Most-Recently Used (MRU).
 *
 * The function printSummary() is given to print output. You MUST use this to
 *     print the number of hits, misses, and evictions incurred by your
 *     simulator. This is crucial for the driver to evaluate your work.
 */
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <limits.h>
#include <string.h>
#include <errno.h>
#include "cachelab.h"

//#define DEBUG_ON
#define ADDRESS_LENGTH 64

/* Type: Memory address */
typedef unsigned long long int mem_addr_t;

/* Type: Cache line
   Member mru is a counter used to implement MRU replacement policy */
typedef struct cache_line {
    char valid;
    mem_addr_t tag;
    unsigned long long int mru;
} cache_line_t;

typedef cache_line_t* cache_set_t;
typedef cache_set_t* cache_t;

/* Globals set by command line args */
int verbosity = 0; /* print trace if set */
int s = 0; /* set index bits */
int b = 0; /* block offset bits */
int E = 0; /* associativity */
char* trace_file = NULL;

/* Derived from command line args */
int S; /* number of sets */
int B; /* block size (bytes) */

/* Counters used to record cache statistics */
int miss_count = 0;
int hit_count = 0;
int eviction_count = 0;
unsigned long long int mru_counter = 1;

/* The cache we are simulating */
cache_t cache;
mem_addr_t set_index_mask;

/*
 * initCache - Allocate memory, write 0's for valid, tag, and MRU. Also computes
 *             the set_index_mask.
 */
void initCache()
{	
	int counter; //initialize counter outside of loop for optimization
	cache = malloc (S * sizeof(*cache)); //allocate memory for cache
	for(counter = 0; counter < S; counter++){//for counter less than the number of sets
		cache[counter] = calloc(E, sizeof(*cache[counter])); //write 0's for valid, tag, and MRU
	}
	set_index_mask = S - 1 ; //computes the set_index_mask
}

/*
 * freeCache - Free allocated memory.
 */
void freeCache()
{
    int i;
    for (i = 0; i < S; i++)
    {
        free(cache[i]);
    }
    free(cache);
}

/*
 * accessData - Access data at memory address addr. If it is already in the
 *              cache, increment hit_count. If it is not in the cache, bring it
 *              in the cache and increment miss count instead. Also, increment
 *              eviction_count if a line is evicted.
 */
void accessData(mem_addr_t addr)
{
    int count;
    mem_addr_t set_num = (addr >> b) & set_index_mask; //gets the set number from the input
    mem_addr_t tag = (addr >> (b+s)); //gets the tag bytes

    for(count = 0; count<E; count++){ //for counter less than number of lines
	if(cache[set_num][count].tag == tag && cache[set_num][count].valid != 0){ //if the tags match and the tag isn't 0, then there is a hit
		hit_count++;
		if(verbosity){
			printf("hit ");
		}
		cache[set_num][count].mru = mru_counter++; //update the cache to simiulate memory being accessed and incremented
		return;
		
	}
    }
    
    miss_count++; //cold miss
    mem_addr_t min_mru = 0; //set the min_mru
    int evicted_line_number = 0; //initialize a variable to count the number of evicted lines
    if(verbosity){
	printf("miss ");
    }
	for(count = 0; count<E; count++){ //case for an empty line
		if(cache[set_num][count].valid ==0){ //if the valid bit is 0 then
			cache[set_num][count].valid = 1; //make the bit 1
			cache[set_num][count].mru = mru_counter++; //up the counter
			cache[set_num][count].tag = tag; //update the tag
			return; //return
		}
	}

    for(count = 0; count<E; count++){ //for the number of lines, if the mru value is less than the minimum mru value then we say there is 
	if(cache[set_num][count].mru > min_mru){ //a line that must be evicted at the current line count.
		evicted_line_number = count;
		min_mru = cache[set_num][count].mru; //the minimum mru must then be updated in respect to the cache.
	}
    }

    if(cache[set_num][evicted_line_number].valid == 1){ //if the line's valid bit was a 1, we need to evict the previous data in that line
	eviction_count ++;
		if(verbosity){
			printf("eviction ");
		}
    }
    cache[set_num][evicted_line_number].valid = 1; //Because we "wrote to memory" the line's valid bit is now a 1
    cache[set_num][evicted_line_number].tag = tag; //We access the tag bits and set them to the initial tag value
    cache[set_num][evicted_line_number].mru = mru_counter++; //We need to up the mru_counter after memory is accessed
}


/*
 * replayTrace - Replays the given trace file against the cache.
 */
void replayTrace(char* trace_fn)
{
    char buf[1000];
    mem_addr_t address=0;
    unsigned int len=0;
    FILE* trace_fp = fopen(trace_fn, "r");

    if (!trace_fp)
    {
        fprintf(stderr, "%s: %s\n", trace_fn, strerror(errno));
        exit(1);
    }

    while( fgets(buf, 1000, trace_fp) != NULL )
    {
	if (buf[1] == 'S' || buf[1] == 'L' || buf[1] == 'M'){ /* buf[Y] gives the Yth byte in the trace line */
		sscanf(buf+3, "%llx, %u", &address, &len); //Read address and length from the trace using sscanf
		if(verbosity){
			printf("%c %llx, %u ", buf[1], address, len);
		}
	accessData(address);
	}
	if (buf[1] == 'M'){ //if it's a miss, we need to "load" in the data and access the cache
		accessData(address);
	}
	if (verbosity){
		putchar('\n');
	}
    }

    fclose(trace_fp);
}

/*
 * printUsage - Print usage info
 */
void printUsage(char* argv[])
{
    printf("Usage: %s [-hv] -s <num> -E <num> -b <num> -t <file>\n", argv[0]);
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits.\n");
    printf("  -E <num>   Number of lines per set.\n");
    printf("  -b <num>   Number of block offset bits.\n");
    printf("  -t <file>  Trace file.\n");
    printf("\nExamples:\n");
    printf("  linux>  %s -s 4 -E 1 -b 4 -t traces/yi.trace\n", argv[0]);
    printf("  linux>  %s -v -s 8 -E 2 -b 4 -t traces/yi.trace\n", argv[0]);
    exit(0);
}

/*
 * main - Main routine.
 */
int main(int argc, char* argv[])
{
    char c;

    while( (c=getopt(argc,argv,"s:E:b:t:vh")) != -1 )
    {
        switch (c)
        {
            case 's':
                s = atoi(optarg);
                break;
            case 'E':
                E = atoi(optarg);
                break;
            case 'b':
                b = atoi(optarg);
                break;
            case 't':
                trace_file = optarg;
                break;
            case 'v':
                verbosity = 1;
                break;
            case 'h':
                printUsage(argv);
                exit(0);
            default:
                printUsage(argv);
                exit(1);
        }
    }

    /* Make sure that all required command line args were specified */
    if (s == 0 || E == 0 || b == 0 || trace_file == NULL)
    {
        printf("%s: Missing required command line argument\n", argv[0]);
        printUsage(argv);
        exit(1);
    }

    /* Compute S, E, and B from command line args */
    S =  1 << s; //S = s^2
    B =  1 << b; //B = b^2

    /* Initialize cache */
    initCache();

#ifdef DEBUG_ON
    printf("DEBUG: S:%u E:%u B:%u trace:%s\n", S, E, B, trace_file);
    printf("DEBUG: set_index_mask: %llu\n", set_index_mask);
#endif

	/* Read the trace and access the cache */
    replayTrace(trace_file);

    /* Free allocated memory */
    freeCache();

    /* Output the hit and miss statistics for the autograder */
    printSummary(hit_count, miss_count, eviction_count);
    return 0;
}
