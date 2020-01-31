(deftemplate temperatura_interna
	0 10
	(
		(muy_baja (0 1) (1 0))
		(baja (1 0) (3 1) (5 0))
		(normal (3 0) (5 1) (7 0))
		(alta (5 0) (7 1) (9 0))
		(muy_alta (7 0) (9 1) (10 1))
	)
)

(deftemplate temperatura_externa
	-6 20
	(
		(muy_baja (-6 1) (3 0))
		(baja (0 0) (4 1) (8 0))
		(media (5 0) (9 1) (13 0))
		(alta (10 0) (14 1) (20 0))
	)
)

(deftemplate velocidad
	0 3700
	(
		(apagado (0 0) (0 1) (0 0))
		(baja (1800 0) (2300 1) (2800 0))
		(media (2300 0) (2750 1) (3200 0))
		(alta (2800 0) (3150 1) (3500 0))
		(muy_alta (3200 0) (3450 1) (3700 1))
	)
)


(defrule regla_1
	(temperatura_interna muy_baja)
=>
	(assert (velocidad apagado))
)

(defrule regla_2
	(temperatura_interna muy_baja)
	(temperatura_externa alta)
=>
	(assert (velocidad baja))
)

(defrule regla_3
	(temperatura_interna baja)
=>
	(assert (velocidad apagado))
)

(defrule regla_4
	(temperatura_interna baja)
	(temperatura_externa media)
=>
	(assert (velocidad baja))
)

(defrule regla_5
	(temperatura_interna baja)
	(temperatura_externa alta)
=>
	(assert (velocidad media))
)

(defrule regla_6
	(temperatura_interna normal)
	(temperatura_externa muy_baja)
=>
	(assert (velocidad apagado))
)

(defrule regla_7
	(temperatura_interna normal)
	(temperatura_externa baja)
=>
	(assert (velocidad baja))
)

(defrule regla_8
	(temperatura_interna normal)
	(temperatura_externa media)
=>
	(assert (velocidad media))
)

(defrule regla_9
	(temperatura_interna normal)
	(temperatura_externa alta)
=>
	(assert (velocidad alta))
)

(defrule regla_10
	(temperatura_interna alta)
	(temperatura_externa muy_baja)
=>
	(assert (velocidad baja))
)

(defrule regla_11
	(temperatura_interna alta)
	(temperatura_externa baja)
=>
	(assert (velocidad media))
)

(defrule regla_12
	(temperatura_interna alta)
	(temperatura_externa media)
=>
	(assert (velocidad alta))
)

(defrule regla_13
	(temperatura_interna alta)
	(temperatura_externa alta)
=>
	(assert (velocidad muy_alta))
)




(defrule regla_14
	(temperatura_interna muy_alta)
	(temperatura_externa muy_baja)
=>
	(assert (velocidad media))
)

(defrule regla_15
	(temperatura_interna muy_alta)
	(temperatura_externa baja)
=>
	(assert (velocidad alta))
)

(defrule regla_16
	(temperatura_interna muy_alta)
	(temperatura_externa media)
=>
	(assert (velocidad muy_alta))
)

(defrule regla_17
	(temperatura_interna muy_alta)
	(temperatura_externa alta)
=>
	(assert (velocidad muy_alta))
)



(deffacts hechos
	(temperatura_interna (6.5 0)(6.5 1)(6.5 0))
	(temperatura_externa (7 0)(7 1)(7 0))
)



