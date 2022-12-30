(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 - persona
c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 - carga
b0 b1 b2 b3 b4 - asentamiento
b5 b6 - almacen
r0 r1 r2 r3  - rover
)

(:init
(hay-camino b1 b3)
(hay-camino b1 b5)
(hay-camino b5 b2)
(hay-camino b2 b4)
(hay-camino b1 b6)
(hay-camino b6 b0)
(hay-camino b1 b4)
(hay-camino b2 b6)
(hay-camino b3 b2)
(hay-camino b3 b4)
(hay-camino b5 b3)
(aparcado-en r0 b2)
(aparcado-en r1 b1)
(aparcado-en r2 b5)
(aparcado-en r3 b6)
(esta-en p0 b3)
(esta-en p1 b1)
(esta-en p2 b1)
(esta-en p3 b0)
(esta-en p4 b0)
(esta-en p5 b1)
(esta-en p6 b3)
(esta-en p7 b2)
(esta-en p8 b2)
(esta-en p9 b3)
(esta-en c0 b6)
(esta-en c1 b5)
(esta-en c2 b6)
(esta-en c3 b5)
(esta-en c4 b5)
(esta-en c5 b6)
(esta-en c6 b5)
(esta-en c7 b6)
(esta-en c8 b6)
(esta-en c9 b5)
(= (current-capacity r0) 0)
(= (current-capacity r1) 0)
(= (current-capacity r2) 0)
(= (current-capacity r3) 0)
(= (gas-level r0) 11)
(= (gas-level r1) 14)
(= (gas-level r2) 10)
(= (gas-level r3) 12)

)

(:goal
(and
(or (esta-en p1 b0) (esta-en p1 b4) (esta-en p1 b1) )
(or (esta-en p7 b1) (esta-en p7 b3) (esta-en p7 b0) )
(esta-en c2 b4)
(esta-en p2 b3)
(or (esta-en c7 b0) (esta-en c7 b3) )
(or (esta-en p6 b3) (esta-en p6 b2) (esta-en p6 b1) )
(or (esta-en c1 b2) (esta-en c1 b4) )
(or (esta-en p4 b3) (esta-en p4 b1) )
(or (esta-en c8 b4) (esta-en c8 b2) )
(or (esta-en p8 b3) (esta-en p8 b2) (esta-en p8 b1) )
(or (esta-en p3 b2) (esta-en p3 b4) (esta-en p3 b0) )
(esta-en c3 b2)
(esta-en p9 b2)
(esta-en p5 b2)
(esta-en c5 b4)
(esta-en c6 b1)

)
)
(:metric maximize
(+ (+ (+ (gas-level r0)  (gas-level r1) ) (gas-level r2) ) (gas-level r3) ))

)