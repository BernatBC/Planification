(define (domain expert-logistic)

    (:requirements :adl :fluents :equality)

    (:types
        rover - object
        base - object
        asentamiento almacen - base
        localizable - object
        persona carga - localizable
    )

    (:predicates
        (esta-en ?loc - localizable ?b - base)
        (aparcado-en ?rov - rover ?b - base)
        (esta-en-rover ?loc - localizable ?rov - rover)
        (hay-camino ?bas - base ?bas2 - base)
    ) 

    (:action mover-rover
        :parameters
        (
            ?rov - rover
            ?from - base
            ?to - base
        )

        :precondition
        (and
            (aparcado-en ?rov ?from)
            (or (hay-camino ?from ?to) (hay-camino ?to ?from))
        )

        :effect
        (and
            (aparcado-en ?rov ?to)
            (not (aparcado-en ?rov ?from))
        )
    )

    (:action load           ; Preguntar si tiene que haber una persona en loc o rover para cargar / descargar
        :parameters
        (
            ?rov - rover
            ?loc - localizable
            ?b - base
        )

        :precondition
        (and
            (aparcado-en ?rov ?b)
            (esta-en ?loc ?b)
            
        )
        :effect
        (and
            (not (esta-en ?loc ?b))
            (esta-en-rover ?loc ?rov)
        )
    )

    (:action unload           ; Preguntar si tiene que haber una persona en loc o rover para cargar / descargar
        :parameters
        (
            ?rov - rover
            ?loc - localizable
            ?b - base
        )

        :precondition
        (and
            (esta-en-rover ?loc ?rov)
            (aparcado-en ?rov ?b)
            
        )
        :effect
        (and
            (esta-en ?loc ?b)
            (not (esta-en-rover ?loc ?rov))
        )
    )

)