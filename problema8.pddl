(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 - persona
c0 - carga
b0 b1 b2  - asentamiento
r0  - rover
)

(:init
(hay-camino b0 b1)
(hay-camino b1 b2)
(aparcado-en r0 b0)
(esta-en p0 b2)
(esta-en c0 b0)
(= (current-capacity r0) 0)
(= (gas-level r0) 14)
(= (sum-petitions) 0)
(important-petition p0 b0)
(low-petition p0 b1)
(medium-petition c0 b0)
)

(:goal
(and
(servido p0)
(servido c0)
)
)

(:metric maximize
    (sum-petitions)
)

)