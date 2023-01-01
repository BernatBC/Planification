(define (domain expert-logistic)

    (:requirements :adl :equality :conditional-effects :fluents)

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
        (sum-petitions)
    )

    (:predicates
        (esta-en ?loc - localizable ?b - base)
        (aparcado-en ?rov - rover ?b - base)
        (esta-en-rover ?loc - localizable ?rov - rover)
        (hay-camino ?bas - base ?bas2 - base)
        (important-petition ?loc - localizable ?b - base)
        (medium-petition ?loc - localizable ?b - base)
        (low-petition ?loc - localizable ?b - base)
        (servido ?loc - localizable)
)

    (:action entrar
        :parameters (
            ?loc - localizable
            ?b - base
        )

        :precondition (and 
            (esta-en ?loc ?b)
            (or
                (important-petition ?loc ?b)
                (medium-petition ?loc ?b)
                (low-petition ?loc ?b)
            )   
            (not (servido ?loc))
        )
        :effect (and
            (servido ?loc)
            (when (low-petition ?loc ?b) (increase (sum-petitions) 3))
            (when (medium-petition ?loc ?b) (increase (sum-petitions) 2))
            (when (important-petition ?loc ?b) (increase (sum-petitions) 1))
            (not (esta-en ?loc ?b))
        )
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
            (> (gas-level ?rov) 0)
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
            (aparcado-en ?rov ?b)
            (< (current-capacity ?rov) 2)
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
            (aparcado-en ?rov ?b)
            (< (current-capacity ?rov) 1)
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
            (esta-en-rover ?loc ?rov)
            (aparcado-en ?rov ?b)
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
            (esta-en-rover ?loc ?rov)
            (aparcado-en ?rov ?b)
            
        )
        :effect
        (and
            (decrease (current-capacity ?rov) 2)
            (esta-en ?loc ?b)
            (not (esta-en-rover ?loc ?rov))

        )
    )


)