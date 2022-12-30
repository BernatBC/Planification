(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 - persona
c0 c1 c2 c3 c4 - carga
b0 b1 - asentamiento
b2 b3 b4 b5 b6 - almacen
r0 r1 r2  - rover
)

(:init
(hay-camino b1 b4)
(hay-camino b4 b2)
(hay-camino b4 b6)
(hay-camino b4 b3)
(hay-camino b2 b5)
(hay-camino b6 b0)
(hay-camino b5 b4)
(hay-camino b2 b3)
(hay-camino b2 b1)
(hay-camino b1 b5)
(aparcado-en r0 b6)
(aparcado-en r1 b3)
(aparcado-en r2 b6)
(esta-en p0 b1)
(esta-en p1 b1)
(esta-en p2 b0)
(esta-en p3 b0)
(esta-en p4 b0)
(esta-en p5 b0)
(esta-en p6 b1)
(esta-en p7 b0)
(esta-en p8 b1)
(esta-en p9 b0)
(esta-en c0 b5)
(esta-en c1 b3)
(esta-en c2 b2)
(esta-en c3 b6)
(esta-en c4 b6)

)

(:goal
(and
(or (esta-en p4 b1) (esta-en p4 b0) )
(or (esta-en p2 b0) (esta-en p2 b1) )
(or (esta-en p6 b0) (esta-en p6 b1) )
(or (esta-en c0 b0) (esta-en c0 b1) )
(esta-en p8 b0)
(or (esta-en p5 b0) (esta-en p5 b1) )
(esta-en c1 b1)
(or (esta-en p1 b1) (esta-en p1 b0) )
(or (esta-en p3 b1) (esta-en p3 b0) )
(esta-en c2 b0)
(esta-en p7 b1)
(or (esta-en c3 b1) (esta-en c3 b0) )
(or (esta-en p9 b1) (esta-en p9 b0) )
(or (esta-en p0 b0) (esta-en p0 b1) )
(esta-en c4 b0)

)
)

)