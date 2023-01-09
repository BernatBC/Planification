(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 - persona
c0 - carga
b0 b1 b2 - asentamiento
b3 b4 b5 b6 - almacen
r0 r1  - rover
)

(:init
(hay-camino b1 b0)
(hay-camino b1 b5)
(hay-camino b1 b4)
(hay-camino b1 b2)
(hay-camino b2 b3)
(hay-camino b5 b6)
(hay-camino b5 b3)
(hay-camino b0 b6)
(hay-camino b0 b2)
(hay-camino b2 b5)
(hay-camino b5 b0)
(aparcado-en r0 b4)
(aparcado-en r1 b2)
(esta-en p0 b2)
(esta-en c0 b3)
(= (current-capacity r0) 0)
(= (gas-level r0) 10)
(= (current-capacity r1) 0)
(= (gas-level r1) 8)
(= (sum-petitions) 6)
(medium-petition p0 b0)
(low-petition p0 b1)
(low-petition p0 b2)
(low-petition c0 b1)
(low-petition c0 b2)
(medium-petition c0 b0)

)

(:goal
(and
(servido p0)
(servido c0)

)
)
(:metric maximize
(+ (* (sum-petitions) 3) (+(gas-level r0)  (gas-level r1) )))

)