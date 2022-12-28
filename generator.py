import random

name = input("Nom del fitxer problema a generar: ")
f = open(name+".pddl", "w")
f.write("""(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
""")

npersones = input("# de Persones: ")
ncargues = input("# de Càrregues: ")
nrovers = input("# de Rovers: ")
nbases = input("# de Bases: ")

for i in range(int(npersones)):
    f.write("p"+str(i)+" ")

f.write("- persona\n")

for i in range(int(ncargues)):
    f.write("c"+str(i)+" ")

f.write("- carga\n")

n_asentamientos = random.randint(1,int(nbases)-1)

print(n_asentamientos)

mybool = False

for i in range(int(nbases)):
    if (i < n_asentamientos):
        f.write("b"+str(i)+" ")
    else:
        if (not mybool):
            f.write("- asentamiento\n")
            mybool = True
        f.write("b"+str(i)+" ")

f.write("- almacen\n")

for i in range(int(nrovers)):
    f.write("r"+str(i)+" ")

f.write(" - rover\n)\n\n")


f.close()