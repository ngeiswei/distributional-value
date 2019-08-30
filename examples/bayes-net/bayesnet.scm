
(use-modules (opencog distvalue))

(define R (ConceptNode "Rain"))
(define S (ConceptNode "Sprinkler"))
(define W (ConceptNode "Grass Wet"))
(define SR (InheritanceLink R S))
(define RandS (ProductLink R S))
(define pRSW (ProductLink
                (ConceptNode "Rain")
                (ConceptNode "Sprinkler")
                (ConceptNode "Grass Wet")))
(define WRS (InheritanceLink (ProductLink R S) W))

(define key (PredicateNode "CDV"))

(define dvR (cog-new-dv R))
(cog-dv-add-evidence dvR (FloatValue 0) 80000)
(cog-dv-add-evidence dvR (FloatValue 1) 20000)
(cog-set-value! R key dvR)

(define dvSR0 (cog-new-dv R))
(cog-dv-add-evidence dvSR0 (FloatValue 0) 48000)
(cog-dv-add-evidence dvSR0 (FloatValue 1) 32000)
(define dvSR1 (cog-new-dv S))
(cog-dv-add-evidence dvSR1 (FloatValue 0) 19800)
(cog-dv-add-evidence dvSR1 (FloatValue 1) 200)

(define cdvSR (cog-new-cdv SR))
(cog-cdv-add-evidence cdvSR (FloatValue 0) dvSR0)
(cog-cdv-add-evidence cdvSR (FloatValue 1) dvSR1)

(cog-set-value! SR key cdvSR)

(define dvWRS00 (cog-new-dv W))
(cog-dv-add-evidence dvWRS00 (FloatValue 0) 48000)
(define dvWRS01 (cog-new-dv W))
(cog-dv-add-evidence dvWRS01 (FloatValue 0) 3200)
(cog-dv-add-evidence dvWRS01 (FloatValue 1) 28800)
(define dvWRS10 (cog-new-dv W))
(cog-dv-add-evidence dvWRS10 (FloatValue 0) 3960)
(cog-dv-add-evidence dvWRS10 (FloatValue 1) 15840)
(define dvWRS11 (cog-new-dv W))
(cog-dv-add-evidence dvWRS11 (FloatValue 0) 2)
(cog-dv-add-evidence dvWRS11 (FloatValue 1) 198)

(define cdvWRS (cog-new-cdv WRS))
(cog-cdv-add-evidence cdvWRS (FloatValue 0 0) dvWRS00)
(cog-cdv-add-evidence cdvWRS (FloatValue 0 1) dvWRS01)
(cog-cdv-add-evidence cdvWRS (FloatValue 1 0) dvWRS10)
(cog-cdv-add-evidence cdvWRS (FloatValue 1 1) dvWRS11)

(cog-set-value! WRS key cdvWRS)

(load "pln-config.scm")

;Run Inference manually
(cog-execute! modus-ponens-inheritance-rule)
;(display (cog-value S key))
(cog-execute! joint-inheritance-introduction-rule)
;(cog-cdv-get-joint dvWRS dvRandS)
;(display (cog-value pRSW key))
(cog-execute! joint-reduction-rule)
;(display (cog-value S key))
(cog-execute! modus-ponens-inheritance-rule)
;(display (cog-value S key))
(cog-execute! joint-to-inheritance-second-rule)
(cog-value (Inheritance W R) key)
