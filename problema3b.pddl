(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 p3 p4 - persona
c0 c1 c2 c3 c4 - carga
b0 b1 - asentamiento
b2 b3 - almacen
r0 r1 r2 r3  - rover
)

(:init
(hay-camino b0 b1)
(hay-camino b1 b2)
(hay-camino b2 b3)
(hay-camino b3 b1)
(hay-camino b0 b2)
(aparcado-en r0 b0)
(aparcado-en r1 b3)
(aparcado-en r2 b2)
(aparcado-en r3 b0)
(esta-en p0 b1)
(esta-en p1 b0)
(esta-en p2 b0)
(esta-en p3 b1)
(esta-en p4 b1)
(esta-en c0 b3)
(esta-en c1 b3)
(esta-en c2 b2)
(esta-en c3 b3)
(esta-en c4 b3)
(= (current-capacity r0) 0)
(= (current-capacity r1) 0)
(= (current-capacity r2) 0)
(= (current-capacity r3) 0)
(= (gas-level r0) 8)
(= (gas-level r1) 5)
(= (gas-level r2) 5)
(= (gas-level r3) 6)

)

(:goal
(and
(or (esta-en p0 b0) (esta-en p0 b1) )
(or (esta-en p1 b0) (esta-en p1 b1) )
(esta-en c2 b0)
(esta-en c0 b0)
(esta-en p3 b0)
(esta-en c4 b1)
(esta-en p4 b1)
(esta-en c3 b0)
(esta-en p2 b1)

)
)
(:metric maximize
(+ (+ (+ (gas-level r0)  (gas-level r1) ) (gas-level r2) ) (gas-level r3) ))

)