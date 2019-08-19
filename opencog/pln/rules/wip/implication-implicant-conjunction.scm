;; =====================================================================
;; ImplicationImplicantConjunctionRule
;;
;; ImplicationLink <TV1>
;;    A
;;    C
;; ImplicationLink <TV2>
;;    B
;;    C
;; |-
;; ImplicationLink <TV>
;;    ProductLink
;;       A
;;       B
;;    C
;;----------------------------------------------------------------------

(use-modules (opencog distvalue))

(load "../utility.scm")

(define implication-implicant-conjunction-variables
  (VariableList
     (TypedVariable
        (Variable "$A")
        (TypeChoice
           (Type "PredicateNode")
           (Type "LambdaLink")))
     (TypedVariable
        (Variable "$B")
        (TypeChoice
           (Type "PredicateNode")
           (Type "LambdaLink")))
     (TypedVariable
        (Variable "$C")
        (TypeChoice
           (Type "PredicateNode")
           (Type "LambdaLink")))))

(define implication-implicant-conjunction-body
  (AndLink
    (ImplicationLink
      (VariableNode "$A")
      (VariableNode "$C"))
    (ImplicationLink
      (VariableNode "$B")
      (VariableNode "$C"))
    (NotLink (EqualLink (VariableNode "$A") (VariableNode "$B")))
    (Evaluation
	  (GroundedPredicate "scm: has-dv")
		(ImplicationLink
	      (VariableNode "$A")
	      (VariableNode "$C"))
    )
    (Evaluation
	  (GroundedPredicate "scm: has-dv")
		(ImplicationLink
	      (VariableNode "$B")
	      (VariableNode "$C"))
    )
  )
)

(define implication-implicant-conjunction-rewrite
  (ExecutionOutput
     (GroundedSchema "scm: implication-implicant-conjunction-formula")
     (List
        (ImplicationLink
           (And
              (Variable "$A")
              (Variable "$B"))
           (Variable "$C"))
        (ImplicationLink
           (VariableNode "$A")
           (VariableNode "$C"))
        (ImplicationLink
           (VariableNode "$B")
           (VariableNode "$C")))))

(define implication-implicant-conjunction-rule
  (Bind
     implication-implicant-conjunction-variables
     implication-implicant-conjunction-body
     implication-implicant-conjunction-rewrite))

(define (implication-implicant-conjunction-formula ABC AC BC)
  (let*
      ((key (PredicateNode "CDV"))
       (cdvAC (cog-value AC key))
	   (cdvBC (cog-value BC key))
	   (cdvABC (cog-cdv-merge cdvAC cdvBC))
	  )
      (update-cdv ABC cdvABC)
  )
)

; Name the rule
(define implication-implicant-conjunction-rule-name
  (DefinedSchemaNode "implication-implicant-conjunction-rule"))
(DefineLink implication-implicant-conjunction-rule-name
  implication-implicant-conjunction-rule)
