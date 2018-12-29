import random
import copy

from problem import Problem

class Scheduling(Problem):
    '''
    The scheduling problem is an optimization problem that is attempting to minimize
    the time it takes to complete a collection of jobs distributed across a number of
    people or processors or robots or whatever is doing the work. Formally, it would be
    defined as:
    - A collection of _n_ jobs.
    - Each job _j_ take time <i>t<sub>j</sub></i>
    - There are _p_ people to process the jobs
    - Each person completes his/her last job at time <i>p<sub>t</sub></i>
    - The time to complete all jobs is the maximum over all <i>p<sub>t</sub></i>

    A state can be represented as a list of size _n_. Each element state[i] is in the
    range {0:p-1}, which indicates that job _i_ will be completed by person state[i].
    '''

    def __init__(self, job_times, people_count = 3, start_state=None,
                 neighbor_selection="switch", objective_fn="time", start_fn="random"):

        Problem.__init__(self, [])
        self.job_count = len(job_times)
        self.job_times = job_times
        self.people_count = people_count
        self.start_state = start_state
        self.start_fn = start_fn
        # Keeping these in case you want to experiment with objective fn and neighbors
        self.neighbor_selection = neighbor_selection
        self.objective_fn = objective_fn
        self.initialize_neighbor_selection_dict()
        self.initialize_objective_fn_dict()

    def random_solution_state(self):
        # Randomly assign every job to a person
        return [random.randint(0,self.people_count-1) for i in range(self.job_count)]

    def get_initial_state(self):
        if not self.start_fn == "given":
            return self.random_solution_state()
        else:
            return self.start_state

    def get_random_neighbor(self, state):
        new_state = copy.deepcopy(state)
        return self.selection_for_neighbor[self.neighbor_selection](new_state)

    # vvvvvvvvvvvvvv  DEFINE a function to get a neighbor  vvvvvvvvvvvvvv
    # put it in the selection_for_neighbor dictionary below
    #def ....
    def switchperson_for_neighbor(self,state):
        new_state = copy.deepcopy(state)
        index = random.randint(0, self.job_count-1)
        current_person = new_state[index]
        new_random_person = random.randint(0, self.people_count-1)

        while new_random_person==current_person:
            new_random_person = random.randint(0, self.people_count-1)

        new_state[index] = new_random_person
        return new_state


    def apply_objective_function(self, state):
        return self.functions_for_evaluation[self.objective_fn](state)

    # vvvvvvvvvvvvvv  DEFINE at least one objective function  vvvvvvvvvvvvvv
    # put it in the functions_for_evaluation dictionary below
    #def ...
    def highest_time(self, state):
        time = []
        for x in range(self.people_count):
	        time.append(0)

        for i in range(0, len(state)):
            person = state[i]
            time_of_job = self.job_times[i]
            time[person] = time[person] + time_of_job

        return max(time)

    # vvvvvvvvvvvvv   ADD YOUR neighbor and objective fn here vvvvvvvvvvvvvv
    def initialize_neighbor_selection_dict(self):
        self.selection_for_neighbor = {
            "switch": self.switchperson_for_neighbor
        }

    def initialize_objective_fn_dict(self):
        self.functions_for_evaluation = {
            "time": self.highest_time
        }

    def pretty_print(self, node):
        job_assignment = node.state
        print(job_assignment)
        for p in range(self.people_count):
            jobs = [i for i in range(self.job_count) if job_assignment[i]==p]
            print(p,'has jobs',end=" ")
            print(jobs)


        state = node.state
        time = []
        for x in range(self.people_count):
	        time.append(0)

        for i in range(0, len(state)):
            person = state[i]
            time_of_job = self.job_times[i]
            time[person] = time[person] + time_of_job
        print('time= ', max(time))

def all_unique(elements):
    try:
        answer = len(set(elements)) == len(elements)
    except:
        print('FAIL ',elements)
        return True
    return answer
