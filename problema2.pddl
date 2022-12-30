(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 - persona
c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 - carga
b0 b1 b2 - asentamiento
b3 b4 b5 b6 b7 - almacen
r0 r1 r2 r3 r4  - rover
)

(:init
(hay-camino b6 b0)
(hay-camino b6 b1)
(hay-camino b6 b3)
(hay-camino b3 b4)
(hay-camino b1 b2)
(hay-camino b6 b5)
(hay-camino b4 b7)
(hay-camino b4 b0)
(hay-camino b2 b7)
(hay-camino b0 b3)
(hay-camino b7 b1)
(hay-camino b4 b1)
(hay-camino b7 b0)
(hay-camino b2 b4)
(hay-camino b1 b0)
(hay-camino b0 b5)
(hay-camino b4 b5)
(aparcado-en r0 b0)
(aparcado-en r1 b2)
(aparcado-en r2 b0)
(aparcado-en r3 b3)
(aparcado-en r4 b0)
(esta-en p0 b0)
(esta-en p1 b2)
(esta-en p2 b0)
(esta-en p3 b0)
(esta-en p4 b2)
(esta-en p5 b2)
(esta-en p6 b1)
(esta-en p7 b2)
(esta-en p8 b0)
(esta-en p9 b0)
(esta-en p10 b1)
(esta-en p11 b2)
(esta-en p12 b2)
(esta-en p13 b0)
(esta-en p14 b2)
(esta-en p15 b0)
(esta-en p16 b2)
(esta-en p17 b1)
(esta-en p18 b2)
(esta-en p19 b0)
(esta-en c0 b3)
(esta-en c1 b7)
(esta-en c2 b6)
(esta-en c3 b4)
(esta-en c4 b5)
(esta-en c5 b5)
(esta-en c6 b5)
(esta-en c7 b5)
(esta-en c8 b7)
(esta-en c9 b7)

)

(:goal
(and
(or (esta-en c1 b1) (esta-en c1 b2) )
(esta-en p2 b2)
(esta-en c0 b2)
(or (esta-en p3 b0) (esta-en p3 b2) )
(or (esta-en p6 b1) (esta-en p6 b2) )
(or (esta-en p4 b2) (esta-en p4 b0) )
(esta-en p7 b1)
(or (esta-en p1 b0) (esta-en p1 b1) )
(esta-en c2 b2)
(or (esta-en p12 b2) (esta-en p12 b1) )
(esta-en p5 b2)
(or (esta-en p11 b1) (esta-en p11 b0) (esta-en p11 b2) )
(esta-en p19 b2)
(or (esta-en p8 b0) (esta-en p8 b2) )
(or (esta-en p10 b0) (esta-en p10 b2) )
(or (esta-en p13 b0) (esta-en p13 b1) )
(esta-en p14 b0)
(or (esta-en c8 b1) (esta-en c8 b0) )
(esta-en p15 b1)
(or (esta-en p17 b1) (esta-en p17 b2) )
(or (esta-en c5 b1) (esta-en c5 b0) )
(esta-en c6 b0)
(esta-en c9 b2)
(esta-en c4 b0)
(esta-en c3 b0)
(esta-en p16 b2)

)
)

)