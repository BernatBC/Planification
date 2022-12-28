import random
import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

name = input("Nom del fitxer problema a generar: ")
f = open(name+".pddl", "w")
f.write("""(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
""")

npersones = input("# de Persones: ")
ncargues = input("# de Càrregues: ")
nrovers = input("# de Rovers: ")
nbases = int(input("# de Bases: "))
nedges = int(input("# de Connexions entre bases ("+str(nbases-1)+"-"+str(nbases*(nbases-1)//2)+"): "))


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
f.write("(:init\n")

# Generarem un graf aleatori connex
G = nx.Graph()

visited = []
left = [i for i in range(1, nbases+1)]
edges = []

G.add_nodes_from(left)

# Node inicial
visited.append(random.choice(left))
left.remove(visited[0])

# Generarem un Spanning Tree (n-1 arestes)
while (len(left) != 0):
    vis = random.choice(visited)
    new = random.choice(left)
    f.write("(hay-camino b"+str(vis)+" b"+str(new)+")\n")
    #f.write("(hay-camino b"+str(new)+" b"+str(vis)+")\n")
    edges.append((vis, new))
    nedges -= 1
    visited.append(new)
    left.remove(new)

# Acabem de omplir arestes aleatories
while (nedges > 0):
    n1 = random.choice(visited)
    n2 = random.choice(visited)
    if ((n1, n2) in edges or (n2, n1) in edges or n1 == n2):
        continue
    edges.append((n1, n2))
    f.write("(hay-camino b"+str(n1)+" b"+str(n2)+")\n")
    #f.write("(hay-camino b"+str(n2)+" b"+str(n1)+")\n")
    nedges -= 1

G.add_edges_from(edges)
pos = nx.kamada_kawai_layout(G, scale=20)

nx.draw(G, pos, with_labels=True, font_weight='bold')

plt.show()
f.close()