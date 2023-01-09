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
(hay-camino b3 b1)
(hay-camino b1 b0)
(hay-camino b3 b2)
(hay-camino b2 b1)
(aparcado-en r0 b0)
(aparcado-en r1 b0)
(esta-en p0 b1)
(esta-en p1 b1)
(esta-en p2 b1)
(esta-en c0 b2)
(esta-en c1 b2)
(esta-en c2 b3)
(= (current-capacity r0) 0)
(= (current-capacity r1) 0)
(= (gas-level r0) 12)
(= (gas-level r1) 9)
(petition p1 b0)
(petition p1 b1)
(petition p0 b0)
(petition c2 b0)
(petition p2 b0)
(petition c1 b1)
(petition c1 b0)
(petition c0 b0)

)

(:goal
(and
(servido p1)
(servido p0)
(servido c2)
(servido p2)
(servido c1)
(servido c0)

)
)
(:metric maximize
(+ (gas-level r0)  (gas-level r1) ))

)
