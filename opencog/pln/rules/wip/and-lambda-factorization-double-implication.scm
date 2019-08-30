;; =======================================================================
;; AndLink Lambda Factorization Rule
;;
;; WARNING: Not BC compatible.
;;
;; TODO: Replace this by higher order fact
;;
;; AndLink
;;    LambdaLink
;;       V
;;       A1
;;    ...
;;    LambdaLink
;;       V
;;       An
;; |-
;; LambdaLink
;;    V
;;    AndLink
;;       A1
;;       ...
;;       An
;;
;; where V is a variable or a list of variables, A1 to An are bodies
;; using containing variable(s) V.
;;
;; Also, the consequent will actually be the doudble implication
;;
;; ImplicationLink <1 1>
;;    AndLink
;;       LambdaLink
;;          V
;;          A1
;;       ...
;;       LambdaLink
;;          V
;;          An
;;    LambdaLink
;;       V
;;       AndLink
;;          A1
;;          ...
;;          An
;;
;; ImplicationLink <1 1>
;;    LambdaLink
;;       V
;;       AndLink
;;          A1
;;          ...
;;          An
;;    AndLink
;;       LambdaLink
;;          V
;;          A1
;;       ...
;;       LambdaLink
;;          V
;;          An
;;
;; Because it is much easier to chain later on. This will be replaced
;; by higher order facts later.
;; -----------------------------------------------------------------------

(use-modules (opencog distvalue))

(define and-lambda-factorization-double-implication-variables
  (VariableList
    (TypedVariableLink
      (VariableNode "$TyVs")
      (TypeChoice
        (TypeNode "TypedVariableLink")
        (TypeNode "VariableNode")
        (TypeNode "VariableList")))
    (VariableNode "$A1")
    (VariableNode "$A2")))

(define and-lambda-factorization-double-implication-body
    (ProductLink
      (LocalQuoteLink (LambdaLink
        (VariableNode "$TyVs")
        (VariableNode "$A1")))
      (LocalQuoteLink (LambdaLink
        (VariableNode "$TyVs")
        (VariableNode "$A2")))
	)
)


(define and-lambda-factorization-double-implication-rewrite
  (ExecutionOutputLink
     (GroundedSchemaNode "scm: and-lambda-factorization-double-implication-formula")
     (ListLink
        (VariableNode "$TyVs")
        (VariableNode "$A1")
        (VariableNode "$A2"))))

(define and-lambda-factorization-double-implication-rule
  (BindLink
     and-lambda-factorization-double-implication-variables
     and-lambda-factorization-double-implication-body
     and-lambda-factorization-double-implication-rewrite))

(define (and-lambda-factorization-double-implication-formula var a1 a2)
  (let* ((and-lamb (AndLink (LambdaLink var a1) (LambdaLink var a2)))
         (lamb (LambdaLink var (cog-new-flattened-link 'AndLink a1 a2)))
         (key (PredicateNode "CDV"))
		)
        (update-dv lamb (cog-value and-lamb key))
        (List
         (update-cdv (ImplicationLink and-lamb lamb) truecdv)
         (update-cdv (ImplicationLink lamb and-lamb) truecdv)
        )
  )
)

(define truecdv
  (let*
      ((dv0 (cog-new-dv-simple 0 0.99))
       (dv1 (cog-new-dv-simple 1 0.99))
       (cdv (cog-new-cdv (Implication (Concept "A") (Concept "B"))))
      )
      (begin
        (cog-cdv-add-evidence cdv (FloatValue 0) dv0)
        (cog-cdv-add-evidence cdv (FloatValue 1) dv1)
      )
  )
)

;; Name the rule
(define and-lambda-factorization-double-implication-rule-name
  (DefinedSchemaNode "and-lambda-factorization-double-implication-rule"))
(DefineLink and-lambda-factorization-double-implication-rule-name
  and-lambda-factorization-double-implication-rule)
