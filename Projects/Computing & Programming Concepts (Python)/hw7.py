import os
def routefilter():
    count=0
    while count<3:
        filein=input('Enter the source file name: ')
        if os.path.isfile(filein):
            ifile=open(filein,'r')
            fileout=input('Enter the output file name: ')
            if os.path.isfile(fileout):
                response=input('File exists...overwrite? y/n')
                if response.lower()!='y':
                    return('Exiting')
            ofile=open(fileout,'w')
            prompt=input('Enter airport symbol: ')
            while ifile.readline() != '':
                prompt=prompt.lower()
                r=ifile.readline()
                x=r.lower()
                if prompt in x:
                    ofile.write(r)
            count=3
        else:
            count=count+1
            if count==3:
                return('Failed to find')       
    ifile.close()
    ofile.close()
    return('Finished')
def main():
    return(routefilter())
