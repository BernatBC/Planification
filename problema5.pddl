(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 - persona
c0 c1 c2 - carga
b0 b1 b2 - asentamiento
b3 b4 b5 b6 b7 b8 b9 - almacen
r0  - rover
)

(:init
(hay-camino b2 b6)
(hay-camino b2 b1)
(hay-camino b2 b8)
(hay-camino b8 b3)
(hay-camino b6 b9)
(hay-camino b2 b5)
(hay-camino b5 b7)
(hay-camino b7 b0)
(hay-camino b0 b4)
(hay-camino b0 b8)
(hay-camino b0 b9)
(hay-camino b3 b9)
(hay-camino b5 b8)
(hay-camino b9 b8)
(hay-camino b3 b0)
(hay-camino b6 b5)
(hay-camino b3 b7)
(hay-camino b5 b4)
(hay-camino b4 b7)
(hay-camino b8 b6)
(hay-camino b4 b3)
(hay-camino b0 b6)
(hay-camino b3 b5)
(aparcado-en r0 b5)
(esta-en p0 b0)
(esta-en p1 b2)
(esta-en p2 b1)
(esta-en c0 b9)
(esta-en c1 b9)
(esta-en c2 b9)
(= (current-capacity r0) 0)
(= (gas-level r0) 20)
(= (sum-petitions) 0)
(low-petition p1 b2)
(important-petition p1 b0)
(important-petition p1 b1)
(medium-petition c0 b0)
(medium-petition c2 b0)
(important-petition c2 b1)
(low-petition c2 b2)
(low-petition c1 b2)
(medium-petition p2 b0)
(important-petition p2 b1)

)

(:goal
(and
(servido p1)
(servido c0)
(servido c2)
(servido c1)
(servido p2)

)
)
(:metric maximize
(+ (* (sum-petitions) 3) (gas-level r0) ))

)