(define (problem expert-logistic)
    (:domain expert-logistic)

    (:objects
        p1 p2 p3 - persona
        c1 c2 c3 - carga
        b1 b2 - asentamiento
        b3 - almacen
        r - rover
    )

    (:init
        (esta-en p1 b1)
        (esta-en p2 b1)
        (esta-en p3 b1)
        (esta-en c1 b3)
        (esta-en c2 b3)
        (esta-en c3 b3)
        (aparcado-en r b2)
        (hay-camino b1 b2)
        (hay-camino b2 b3)
        (hay-camino b3 b1)
    )

    (:goal
        (and
            (esta-en p1 b2)
            (esta-en p2 b2)
            (esta-en p3 b2)
            (esta-en c1 b2)
            (esta-en c2 b1)
            (esta-en c3 b2)
        )
    )

)