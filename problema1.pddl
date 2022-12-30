(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 - persona
c0 c1 c2 c3 c4 - carga
b0 b1 b2 b3 - asentamiento
b4 b5 - almacen
r0 r1 r2  - rover
)

(:init
(hay-camino b3 b4)
(hay-camino b4 b5)
(hay-camino b4 b0)
(hay-camino b4 b1)
(hay-camino b3 b2)
(hay-camino b2 b4)
(hay-camino b1 b2)
(hay-camino b1 b3)
(aparcado-en r0 b1)
(aparcado-en r1 b3)
(aparcado-en r2 b3)
(esta-en p0 b3)
(esta-en p1 b0)
(esta-en p2 b1)
(esta-en p3 b1)
(esta-en p4 b0)
(esta-en p5 b3)
(esta-en p6 b3)
(esta-en p7 b3)
(esta-en p8 b0)
(esta-en p9 b1)
(esta-en c0 b4)
(esta-en c1 b5)
(esta-en c2 b5)
(esta-en c3 b5)
(esta-en c4 b4)
(= (current-capacity r0) 0)
(= (current-capacity r1) 0)
(= (current-capacity r2) 0)
(= (gas-level r0) 10)
(= (gas-level r1) 9)
(= (gas-level r2) 12)

)

(:goal
(and
(or (esta-en p6 b2) (esta-en p6 b3) )
(or (esta-en c1 b3) (esta-en c1 b2) (esta-en c1 b0) )
(or (esta-en p2 b2) (esta-en p2 b0) )
(esta-en p7 b0)
(esta-en p0 b2)
(or (esta-en c4 b0) (esta-en c4 b2) (esta-en c4 b1) )
(or (esta-en p5 b1) (esta-en p5 b3) )
(or (esta-en c0 b0) (esta-en c0 b2) )
(or (esta-en c2 b1) (esta-en c2 b0) (esta-en c2 b3) )
(or (esta-en c3 b1) (esta-en c3 b2) )
(or (esta-en p9 b1) (esta-en p9 b0) )
(esta-en p3 b2)
(esta-en p4 b2)

)
)
(:metric maximize
(+ (+ (gas-level r0)  (gas-level r1) ) (gas-level r2) ))

)