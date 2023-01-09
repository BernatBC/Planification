(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 - persona
c0 c1 c2 - carga
b0 b1 - asentamiento
b2 b3 - almacen
r0 r1  - rover
)

(:init
(hay-camino b2 b3)
(hay-camino b2 b0)
(hay-camino b0 b1)
(hay-camino b3 b1)
(aparcado-en r0 b2)
(aparcado-en r1 b3)
(esta-en p0 b1)
(esta-en p1 b1)
(esta-en p2 b1)
(esta-en c0 b3)
(esta-en c1 b2)
(esta-en c2 b3)
(= (current-capacity r0) 0)
(= (current-capacity r1) 0)
(= (gas-level r0) 8)
(= (gas-level r1) 8)
(= (sum-petitions) 18)
(low-petition p0 b1)
(low-petition p0 b0)
(low-petition c1 b1)
(important-petition c1 b0)
(medium-petition c2 b1)
(medium-petition p2 b1)
(low-petition p2 b0)
(medium-petition p1 b0)

)

(:goal
(and
(servido p0)
(servido c1)
(servido c2)
(servido p2)
(servido p1)

)
)
(:metric maximize
(sum-petitions) )

)