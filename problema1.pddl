(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 - persona
c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 - carga
b0 b1 b2 b3 - asentamiento
b4 b5 b6 b7 - almacen
r0 r1 r2 r3 r4  - rover
)

(:init
(hay-camino b1 b7)
(hay-camino b7 b4)
(hay-camino b1 b3)
(hay-camino b7 b2)
(hay-camino b1 b5)
(hay-camino b4 b0)
(hay-camino b7 b6)
(hay-camino b6 b2)
(hay-camino b7 b3)
(hay-camino b0 b6)
(hay-camino b0 b7)
(hay-camino b5 b4)
(hay-camino b3 b2)
(hay-camino b4 b1)
(hay-camino b1 b0)
(hay-camino b1 b2)
(hay-camino b2 b4)
(aparcado-en r0 b4)
(aparcado-en r1 b1)
(aparcado-en r2 b1)
(aparcado-en r3 b3)
(aparcado-en r4 b4)
(esta-en p0 b1)
(esta-en p1 b1)
(esta-en p2 b3)
(esta-en p3 b0)
(esta-en p4 b3)
(esta-en p5 b3)
(esta-en p6 b1)
(esta-en p7 b2)
(esta-en p8 b0)
(esta-en p9 b0)
(esta-en p10 b2)
(esta-en p11 b1)
(esta-en p12 b1)
(esta-en p13 b3)
(esta-en p14 b1)
(esta-en p15 b2)
(esta-en p16 b0)
(esta-en p17 b1)
(esta-en p18 b0)
(esta-en p19 b1)
(esta-en c0 b7)
(esta-en c1 b4)
(esta-en c2 b7)
(esta-en c3 b6)
(esta-en c4 b5)
(esta-en c5 b5)
(esta-en c6 b6)
(esta-en c7 b6)
(esta-en c8 b4)
(esta-en c9 b5)

)

(:goal
(and
(or (esta-en c1 b2) (esta-en c1 b1) )
(or (esta-en p11 b3) (esta-en p11 b2) (esta-en p11 b1) )
(or (esta-en p10 b0) (esta-en p10 b2) )
(esta-en p12 b3)
(or (esta-en p0 b3) (esta-en p0 b0) (esta-en p0 b1) )
(or (esta-en p18 b0) (esta-en p18 b1) (esta-en p18 b2) )
(or (esta-en p2 b2) (esta-en p2 b1) (esta-en p2 b3) )
(or (esta-en p4 b1) (esta-en p4 b0) )
(esta-en p3 b1)
(or (esta-en c2 b1) (esta-en c2 b0) (esta-en c2 b3) (esta-en c2 b2) )
(or (esta-en c6 b2) (esta-en c6 b0) )
(esta-en c0 b2)
(or (esta-en p16 b1) (esta-en p16 b2) )
(or (esta-en p5 b2) (esta-en p5 b3) )
(or (esta-en c9 b0) (esta-en c9 b2) (esta-en c9 b1) )
(or (esta-en p13 b1) (esta-en p13 b3) (esta-en p13 b0) )
(esta-en p8 b0)
(esta-en c8 b2)
(or (esta-en p14 b1) (esta-en p14 b3) )
(esta-en c5 b2)
(esta-en p17 b3)
(esta-en p9 b3)
(esta-en p15 b0)

)
)

)