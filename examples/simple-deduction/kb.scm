
(use-modules (opencog distvalue))

(define A (ConceptNode "A"))
(define B (ConceptNode "B"))
(define C (ConceptNode "C"))
(define AB (InheritanceLink A B))
(define BC (InheritanceLink B C))
(define AC (InheritanceLink A C))

(ConceptNode "dvAB")
(ConceptNode "dvBC")

(define key (PredicateNode "CDV"))

(define dvA (cog-new-dv A))
(define dvB (cog-new-dv B))

(cog-dv-add-evidence dvA (FloatValue 0) 30)
(cog-dv-add-evidence dvA (FloatValue 1) 70)
(cog-dv-add-evidence dvB (FloatValue 0) 30)
(cog-dv-add-evidence dvB (FloatValue 1) 70)

(define dvAB (cog-new-cdv AB))
(define dvBC (cog-new-cdv BC))

(cog-cdv-add-evidence dvAB (FloatValue 1) dvA)
(cog-cdv-add-evidence dvBC (FloatValue 1) dvB)

(cog-set-value! AB key dvAB)
(cog-set-value! BC key dvBC)

(load "pln-config.scm")

(cog-execute! deduction-inheritance-rule)

(cog-value AC key)
