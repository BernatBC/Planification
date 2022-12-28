(define (domain expert-logistic)

    (:requirements :adl :fluents :equality)

    (:types
        rover - object
        base - object
        asentamiento almacen - base
        localizable - object
        persona carga - localizable
    )

    (:functions
        (current-capacity ?rov - rover)
        (gas-level ?rov - rover)
    )

    (:predicates
        (esta-en ?loc - localizable ?b - base)
        (aparcado-en ?rov - rover ?b - base)
        (esta-en-rover ?loc - localizable ?rov - rover)
        (hay-camino ?bas - base ?bas2 - base)
        ; Duplicar el "load" o añadir un predicado de "es-persona ?loc - localizable"
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
            (> (gas-level ?rov) 0)
            (aparcado-en ?rov ?from)
            (hay-camino ?from ?to) ;Comentar si es dirigido o no
                                    ; Preguntar si el rover tiene que estar tripulado
        )

        :effect
        (and
            (aparcado-en ?rov ?to)
            (not (aparcado-en ?rov ?from))
            (decrease (gas-level ?rov) 1)
        )
    )

    (:action load-persona       ; Preguntar si tiene que haber una persona en loc o rover para cargar / descargar
        :parameters
        (
            ?rov - rover
            ?loc - persona
            ?b - base
        )

        :precondition
        (and
            (< (+ (current-capacity ?rov) 1) 3)
            (aparcado-en ?rov ?b)
            (esta-en ?loc ?b)
        )
        :effect
        (and
            (increase (current-capacity ?rov) 1)
            (not (esta-en ?loc ?b))
            (esta-en-rover ?loc ?rov)
        )
    )

    (:action load-carga         ; Preguntar si tiene que haber una persona en loc o rover para cargar / descargar
        :parameters
        (
            ?rov - rover
            ?loc - carga
            ?b - base
        )

        :precondition
        (and
            (< (+ (current-capacity ?rov) 2) 3)
            (aparcado-en ?rov ?b)
            (esta-en ?loc ?b)
            
        )
        :effect
        (and
            (not (esta-en ?loc ?b))
            (esta-en-rover ?loc ?rov)
            (increase (current-capacity ?rov) 2)

        )
    )



    (:action unload-persona           ; Preguntar si tiene que haber una persona en loc o rover para cargar / descargar
        :parameters
        (
            ?rov - rover
            ?loc - persona
            ?b - base
        )

        :precondition
        (and
            (aparcado-en ?rov ?b)
            (esta-en-rover ?loc ?rov)
            
        )
        :effect
        (and
            (decrease (current-capacity ?rov) 1)
            (esta-en ?loc ?b)
            (not (esta-en-rover ?loc ?rov))
        )
    )

    (:action unload-carga           ; Preguntar si tiene que haber una persona en loc o rover para cargar / descargar
        :parameters
        (
            ?rov - rover
            ?loc - carga
            ?b - base
        )

        :precondition
        (and
            (aparcado-en ?rov ?b)
            (esta-en-rover ?loc ?rov)
            
        )
        :effect
        (and
            (decrease (current-capacity ?rov) 2)
            (esta-en ?loc ?b)
            (not (esta-en-rover ?loc ?rov))
        )
    )


)