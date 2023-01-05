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

npersones = int(input("# de Persones: "))
ncargues = int(input("# de Càrregues: "))
nrovers = int(input("# de Rovers: "))
nbases = int(input("# de Bases (min 3): "))
nedges = int(input("# de Connexions entre bases ("+str(nbases-1)+"-"+str(nbases*(nbases-1)//2)+"): "))
npeticions = int(input("# de Peticiones: "))
ext1 = input("Añadir capacidades (EXT1)? (Y/N): ")
ext2 = input("Añadir combustible (EXT2)? (Y/N): ")
quest = "N"
if (ext2 in ["Y", "y", "Yes", "yes", "YES"]):
    quest = input("[EXT2] Optimizar el combustible usado? (Y/N): ")

ext3 = input("Añadir prioridades (EXT3)? (Y/N): ")
quest3 = "N"
if (ext3 in ["Y", "y", "Yes", "yes", "YES"]):
    quest2 = input("[EXT3] Optimizar además el combustible usado? (Y/N): ")

for i in range(int(npersones)):
    f.write("p"+str(i)+" ")

f.write("- persona\n")

for i in range(int(ncargues)):
    f.write("c"+str(i)+" ")

f.write("- carga\n")

n_asentamientos = random.randint(2, nbases-1)

npeticions = min(npeticions, (npersones+ncargues)*n_asentamientos)

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
left = [i for i in range(nbases)]
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

color_map = []
for node in G:
    if node < n_asentamientos:
        color_map.append('yellow')
    else: 
        color_map.append('orange')      

# Rover placement

for r in range(nrovers):
    base = random.choice(visited)
    f.write("(aparcado-en r"+str(r)+" b"+str(base)+")\n")


for p in range(npersones):
    base = random.randint(0,n_asentamientos-1)
    f.write("(esta-en p"+str(p)+" b"+str(base)+")\n")

for c in range(ncargues):
    base = random.randint(n_asentamientos, nbases-1)
    f.write("(esta-en c"+str(c)+" b"+str(base)+")\n")

if (ext1 in ["Y", "y", "Yes", "yes", "YES"]):
    for r in range(nrovers):
        f.write("(= (current-capacity r"+str(r)+") 0)\n")


if (ext2 in ["Y", "y", "Yes", "yes", "YES"]):
    for r in range(nrovers):
        f.write("(= (gas-level r"+str(r)+") "+str(random.randint(nbases, nbases*2))+")\n")

if (ext3 in ["Y", "y", "Yes", "yes", "YES"]):
    f.write("(= (sum-petitions) "+str(3*(npersones+ncargues))+")\n")


dic = {}

while (npeticions > 0):
    loc = random.randint(0, npersones+ncargues-1)
    base = random.randint(0, n_asentamientos-1)
    
    if (loc in dic.keys()):
        if (base in dic.get(loc)):
            continue
        dic[loc].append(base)
    else:
        dic[loc] = [base]

    npeticions -= 1

if (ext3 not in ["Y", "y", "Yes", "yes", "YES"]):
    for (loc, listbases) in dic.items():
        for b in listbases:
            if (loc < npersones):
                f.write("(petition p"+str(loc)+" b"+str(b)+")\n")
            else:
                f.write("(petition c"+str(loc-npersones)+" b"+str(b)+")\n")

elif (ext3 in ["Y", "y", "Yes", "yes", "YES"]):
    for (loc, listbases) in dic.items():
        for b in listbases:
            rnd = random.randint(1,3)
            if (loc < npersones):
                if (rnd == 1):
                    f.write("(low-petition p"+str(loc)+" b"+str(b)+")\n")
                elif (rnd == 2):
                    f.write("(medium-petition p"+str(loc)+" b"+str(b)+")\n")
                else:
                    f.write("(important-petition p"+str(loc)+" b"+str(b)+")\n")
            else:
                if (rnd == 1):
                    f.write("(low-petition c"+str(loc-npersones)+" b"+str(b)+")\n")
                elif (rnd == 2):
                    f.write("(medium-petition c"+str(loc-npersones)+" b"+str(b)+")\n")
                else:
                    f.write("(important-petition c"+str(loc-npersones)+" b"+str(b)+")\n")


f.write("\n)\n\n(:goal\n(and\n")

#if (ext3 not in ["Y", "y", "Yes", "yes", "YES"]):
#    for (loc, listbases) in dic.items():
#        if (len(listbases) == 1):
#            if (loc < npersones):
#                f.write("(esta-en p"+str(loc)+" b"+str(listbases[0])+")\n")
#            else:
#                f.write("(esta-en c"+str(loc-npersones)+" b"+str(listbases[0])+")\n")
#            continue

#        f.write("(or ")
#        for b in listbases:
#            if (loc < npersones):
#                f.write("(esta-en p"+str(loc)+" b"+str(b)+") ")
#            else:
#                f.write("(esta-en c"+str(loc-npersones)+" b"+str(b)+") ")
#
#        f.write(")\n")
for (loc, listbases) in dic.items():
    if (loc < npersones):
        f.write("(servido p"+str(loc)+")\n")
    else:
        f.write("(servido c"+str(loc-npersones)+")\n")

f.write("\n)\n)\n")

if (quest in ["Y", "y", "Yes", "yes", "YES"] and ext3 not in ["Y", "y", "Yes", "yes", "YES"]):
    f.write("(:metric maximize\n")
    f.write("(+ "*(nrovers-1))
    f.write("(gas-level r0) ")
    for r in range(1, nrovers):
        f.write(" (gas-level r"+str(r)+") )")
    f.write(")\n")

elif (ext3 in ["Y", "y", "Yes", "yes", "YES"] and quest2 not in ["Y", "y", "Yes", "yes", "YES"]):
    f.write("(:metric maximize\n")
    f.write("(sum-petitions) ")
    f.write(")\n")

elif (ext3 in ["Y", "y", "Yes", "yes", "YES"] and quest2 in ["Y", "y", "Yes", "yes", "YES"]):
    f.write("(:metric maximize\n")
    f.write("(+ (* (sum-petitions) 3) ")
    f.write("(+"*(nrovers-1))
    f.write("(gas-level r0) ")
    for r in range(1, nrovers):
        f.write(" (gas-level r"+str(r)+") )")
    f.write("))\n")

f.write("\n)")
f.close()


nx.draw(G, pos, with_labels=True, font_weight='bold', node_color=color_map)

plt.show()
