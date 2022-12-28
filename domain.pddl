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
        (esta-en ?localizable - loc ?base - b)
        (aparcado-en ?rover - rov ?base - b)
        (esta-en-rover ?localizable - loc ?rover - rov)
        (hay-camino ?base - b1 ?base - b2)
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
            (hay-camino ?from ?to) ;Comentar si es dirigido o no
                                    ; Preguntar si el rover tiene que estar tripulado
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
            (aparcado-en ?rov ?b)
            (esta-en-rover ?loc ?rov)
            
        )
        :effect
        (and
            (esta-en ?loc ?b)
            (not (esta-en-rover ?loc ?rov))
        )
    )

)