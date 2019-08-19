;; To be replaced by negation-introduction-rule 

; =====================================================================
; Not introduction rule
;
; A<TV1>
; |-
; NotLink <TV>
;    A
;----------------------------------------------------------------------

(use-modules (opencog distvalue))

(load "../utility.scm")

(define not-introduction-rule
  (BindLink
     (VariableList
        (TypedVariableLink
           (VariableNode "$A")
           (TypeChoice
              (TypeNode "PredicateNode")
              (TypeNode "ConceptNode"))))
     (VariableNode "$A")
     (ExecutionOutputLink
        (GroundedSchemaNode "scm: not-introduction-formula")
        (ListLink
           (VariableNode "$A")))))

(define (not-introduction-formula A)
	(let ((key (PredicateNode "CDV"))
		  (dvA (cog-value A key))
		  (dvNA (cog-dv-negate dvA)))
		(update-dv (NotLink A) dvNA)
	)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some test data (to be removed afterwards) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Name the rule
(define not-introduction-rule-name
  (DefinedSchemaNode "not-introduction-rule"))
(DefineLink
   not-introduction-rule-name
   not-introduction-rule)
