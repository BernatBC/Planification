(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 - persona
c0 c1 - carga
b0 b1 - asentamiento
b2 - almacen
r0  - rover
)

(:init
(hay-camino b1 b2)
(hay-camino b2 b0)
(hay-camino b1 b0)
(aparcado-en r0 b1)
(esta-en p0 b1)
(esta-en p1 b1)
(esta-en c0 b2)
(esta-en c1 b2)
(= (current-capacity r0) 0)
(= (gas-level r0) 5)
(= (sum-petitions) 0)
(low-petition p1 b0)
(important-petition p1 b1)
(important-petition p0 b0)
(important-petition p0 b1)
(medium-petition p1 b0)
(important-petition p1 b1)
(medium-petition p0 b0)
(low-petition p0 b1)

)

(:goal
(and
(or (esta-en p1 b0) (esta-en p1 b1) )
(or (esta-en c0 b0) (esta-en c0 b1) )
(or (esta-en c1 b0) (esta-en c1 b1) )
(or (esta-en p0 b0) (esta-en p0 b1) )

)
)
(:metric maximize
(sum-petitions) )

)