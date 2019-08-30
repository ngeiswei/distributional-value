
(use-modules (opencog distvalue))

(define A (ConceptNode "A"))
(define B (ConceptNode "B"))
(define AB (AndLink A B))

(define key (PredicateNode "CDV"))

(define dvA (cog-new-dv A))
(cog-dv-add-evidence dvA (FloatValue 0) 100)
(cog-dv-add-evidence dvA (FloatValue 0.5) 50)
(cog-dv-add-evidence dvA (FloatValue 1) 50)

(define dvB (cog-new-dv B))
(cog-dv-add-evidence dvB (FloatValue 0.25) 100)
(cog-dv-add-evidence dvB (FloatValue 0.75) 100)

(cog-set-value! A key dvA)
(cog-set-value! B key dvB)

(load "pln-config.scm")

(cog-execute! and-introduction-rule)

(cog-value AB key)
