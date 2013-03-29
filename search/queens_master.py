from queens_random import run_worker 
from multiprocessing import Process, Value

def queen_worker(N, flag):
    res = run_worker(N)
    while res is None:
        pass
    flag.value = 1
import sys
if __name__ == "__main__":
    N = int(sys.argv[1])
    flag = Value('i', 0)
    processes = []
    for i in range (10):
       p = Process(target=queen_worker, args = (N, flag))
       p.start()
       processes.append(p)

    while flag.value == 0:
        pass
    
    for p in processes:
        p.terminate()

    print "done"


        
