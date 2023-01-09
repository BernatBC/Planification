(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 - persona
c0 c1 c2 - carga
b0 b1 - asentamiento
b2 - almacen
r0 r1 r2  - rover
)

(:init
(hay-camino b2 b1)
(hay-camino b2 b0)
(hay-camino b1 b0)
(aparcado-en r0 b0)
(aparcado-en r1 b2)
(aparcado-en r2 b2)
(esta-en p0 b1)
(esta-en p1 b1)
(esta-en p2 b0)
(esta-en c0 b2)
(esta-en c1 b2)
(esta-en c2 b2)
(= (current-capacity r0) 0)
(= (current-capacity r1) 0)
(= (current-capacity r2) 0)
(= (gas-level r0) 6)
(= (gas-level r1) 4)
(= (gas-level r2) 4)

)

(:goal
(and
(or (esta-en p2 b0) (esta-en p2 b1) )
(or (esta-en c1 b1) (esta-en c1 b0) )
(or (esta-en p1 b1) (esta-en p1 b0) )
(or (esta-en c0 b0) (esta-en c0 b1) )
(or (esta-en c2 b0) (esta-en c2 b1) )

)
)
(:metric maximize
(+ (+ (gas-level r0)  (gas-level r1) ) (gas-level r2) ))

)