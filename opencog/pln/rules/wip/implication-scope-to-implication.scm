;; =======================================================================
;; Implication Scope to Implication Rule
;;
;; ImplicationScopeLink
;;    V
;;    P
;;    Q
;; |-
;; ImplicationLink
;;    LambdaLink
;;       V
;;       P
;;    LambdaLink
;;       V
;;       Q
;;
;; where V is a variable declaration, P and Q are the implicant and
;; implicand bodies.
;; -----------------------------------------------------------------------

(use-modules (opencog distvalue))

(load "../utility.scm")

(define implication-scope-to-implication-variables
  (VariableList
     (TypedVariableLink
        (VariableNode "$TyVs")
        (TypeChoice
           (TypeNode "TypedVariableLink")
           (TypeNode "VariableList")))
     (VariableNode "$P")
     (VariableNode "$Q")))

(define implication-scope-to-implication-body
  (AndLink
    (Quote (ImplicationScopeLink
      (Unquote (VariableNode "$TyVs"))
      (Unquote (VariableNode "$P"))
      (Unquote (VariableNode "$Q"))))
    (Evaluation
      (GroundedPredicate "scm: has-dv")
      (Quote (ImplicationScopeLink
        (Unquote (VariableNode "$TyVs"))
        (Unquote (VariableNode "$P"))
        (Unquote (VariableNode "$Q"))))
    )
  )
)

(define implication-scope-to-implication-rewrite
  (ExecutionOutputLink
     (GroundedSchemaNode "scm: implication-scope-to-implication-formula")
     (ListLink
        (Implication
           (Quote (Lambda
              (Unquote (VariableNode "$TyVs"))
              (Unquote (VariableNode "$P"))))
           (Quote (Lambda
              (Unquote (VariableNode "$TyVs"))
              (Unquote (VariableNode "$Q")))))
        (Quote (ImplicationScopeLink
          (Unquote (VariableNode "$TyVs"))
          (Unquote (VariableNode "$P"))
          (Unquote (VariableNode "$Q")))))))

(define implication-scope-to-implication-rule
  (BindLink
     implication-scope-to-implication-variables
     implication-scope-to-implication-body
     implication-scope-to-implication-rewrite))

(define (implication-scope-to-implication-formula Impl ImplSc)
  ; FIXME: merge hi conf
  (let ((key (PredicateNode "CDV")))
	   (update-cdv Impl (cog-value ImplSc key))
  )
)

;; Name the rule
(define implication-scope-to-implication-rule-name
  (DefinedSchemaNode "implication-scope-to-implication-rule"))
(DefineLink implication-scope-to-implication-rule-name
  implication-scope-to-implication-rule)
