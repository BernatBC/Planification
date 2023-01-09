(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 - persona
c0 c1 c2 - carga
b0 b1 b2 - asentamiento
b3 - almacen
r0 r1  - rover
)

(:init
(hay-camino b0 b2)
(hay-camino b0 b1)
(hay-camino b1 b3)
(hay-camino b0 b3)
(aparcado-en r0 b2)
(aparcado-en r1 b0)
(esta-en p0 b0)
(esta-en p1 b1)
(esta-en p2 b1)
(esta-en c0 b3)
(esta-en c1 b3)
(esta-en c2 b3)
(= (current-capacity r0) 0)
(= (current-capacity r1) 0)
(petition p1 b1)
(petition p1 b2)
(petition c2 b0)
(petition c2 b2)
(petition c0 b1)
(petition c1 b2)
(petition p2 b0)
(petition p0 b2)

)

(:goal
(and
(servido p1)
(servido c2)
(servido c0)
(servido c1)
(servido p2)
(servido p0)

)
)

)