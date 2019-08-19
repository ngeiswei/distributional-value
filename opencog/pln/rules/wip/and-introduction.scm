;; To be replaced by conjunction-introduction.scm

; =====================================================================
; And introduction rule
;
; For now A and B can be predicates or concepts. Note that the rule
; will not try to prevent mixing predicates and concepts (we need a
; better type system for that). Also it assumes that A and B are
; independant. The rule should account for relationships between A and
; B (like inheritance, etc) to correct that assumption.
;
; A<TV1>
; B<TV2>
; |-
; AndLink <TV>
;    A
;    B
;----------------------------------------------------------------------

(use-modules (opencog logger))

(use-modules (opencog distvalue))

(load "../utility.scm")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Old rule. We keep for now for backward compatibility ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define and-introduction-rule
  (BindLink
     (VariableList
        (TypedVariableLink
           (VariableNode "$A")
           (TypeChoice
              (TypeNode "PredicateNode")
              (TypeNode "ConceptNode")))
        (TypedVariableLink
           (VariableNode "$B")
           (TypeChoice
              (TypeNode "PredicateNode")
              (TypeNode "ConceptNode"))))
     (AndLink
        (VariableNode "$A")
        (VariableNode "$B")
		(Evaluation
          (GroundedPredicate "scm: has-dv")
          (VariableNode "$A"))
		(Evaluation
          (GroundedPredicate "scm: has-dv")
          (VariableNode "$B"))
        (NotLink
           (EqualLink
              (VariableNode "$A")
              (VariableNode "$B"))))
     (ExecutionOutputLink
        (GroundedSchemaNode "scm: and-introduction-formula")
        (ListLink
           (VariableNode "$A")
           (VariableNode "$B")))))

(define (and-introduction-formula A B)
  (let
	  ((key (PredicateNode "CDV"))
	   (dvA (cog-value A key))
       (dvB (cog-value B key))
	   (dvAB (cog-dv-conjunction dvA dvB))
	  )
      (update-dv (AndLink A B) dvAB)
  )
)

; Name the rule
(define and-introduction-rule-name
  (DefinedSchemaNode "and-introduction-rule"))
(DefineLink
   and-introduction-rule-name
   and-introduction-rule)

;;;;;;;;;;;;;;;
;; New rules ;;
;;;;;;;;;;;;;;;

;; This one is a temporary hack before deep type checking allows
;; better rule definition.
;;
;; Is only used for and-ing EvaluationLinks without free variable in
;; them.
(define and-introduction-grounded-evaluation-rule
  (BindLink
     (VariableList
        (TypedVariableLink
           (VariableNode "$A")
           (TypeNode "EvaluationLink"))
        (TypedVariableLink
           (VariableNode "$B")
           (TypeNode "EvaluationLink"))
        (TypedVariableLink
           (VariableNode "$C")
           (TypeNode "EvaluationLink")))
     (AndLink
        (VariableNode "$A")
        (VariableNode "$B")
        (VariableNode "$C")
        (NotLink
           (EqualLink
              (VariableNode "$A")
              (VariableNode "$B")))
        (NotLink
           (EqualLink
              (VariableNode "$B")
              (VariableNode "$C")))
        (NotLink
           (EqualLink
              (VariableNode "$C")
              (VariableNode "$A")))
        (EvaluationLink
           (GroundedPredicateNode "scm: has-dv")
           (ListLink
              (VariableNode "$A")))
        (EvaluationLink
           (GroundedPredicateNode "scm: has-dv")
           (ListLink
              (VariableNode "$B")))
        (EvaluationLink
           (GroundedPredicateNode "scm: has-dv")
           (ListLink
              (VariableNode "$C")))
        (EvaluationLink
           (GroundedPredicateNode "scm: fully-grounded")
           (ListLink
              (VariableNode "$A")))
        (EvaluationLink
           (GroundedPredicateNode "scm: fully-grounded")
           (ListLink
              (VariableNode "$B")))
        (EvaluationLink
           (GroundedPredicateNode "scm: fully-grounded")
           (ListLink
              (VariableNode "$C"))))
     (ExecutionOutputLink
        (GroundedSchemaNode "scm: and-introduction-grounded-evaluation-formula")
        (ListLink
           (VariableNode "$A")
           (VariableNode "$B")
           (VariableNode "$C")))))

(define (and-introduction-grounded-evaluation-formula A B C)
  (let* ((key (PredicateNode "CDV"))
         (dvA (cog-value A key))
         (dvB (cog-value B key))
         (dvC (cog-value C key))
         (dvBC (cog-dv-conjunction dvB dvC))
         (dvABC (cog-dv-conjunction dvA dvBC))
        )
        (update-dv (And A B C) dvABC)
  )
)

;; The following are for checking that an atom (i.e. a sub-hypergraph)
;; doesn't have free variables.
;;
;; TODO this should be replaced by a scheme binding from a C++
;; function, given how frequent its use should be.
(define (is-variable atom)
  (equal? (cog-type atom) 'VariableNode))

(define (rec-fully-grounded atom)
  (if (cog-node? atom)
      (not (is-variable atom))
      (every rec-fully-grounded (cog-outgoing-set atom))))

(define (fully-grounded atom)
  (if (rec-fully-grounded atom)
      (stv 1 1)
      (stv 0 1)))

;; Name the rule
(define and-introduction-grounded-evaluation-rule-name
  (DefinedSchemaNode "and-introduction-grounded-evaluation-rule"))
(DefineLink and-introduction-grounded-evaluation-rule-name
  and-introduction-grounded-evaluation-rule)
