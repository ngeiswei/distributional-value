;; =======================================================================
;; Implication Instantiation rule
;; (TODO add wiki page)
;;
;; ImplicationScopeLink
;;    V
;;    P
;;    Q
;; T
;; |-
;; Q[V->T]
;;
;; where V is a variable or a list of variables, P is a condition, Q
;; is the implicand, T is an atom (or a list of atoms) to substitute
;; and Q[V->T] is Q where V has been substituted by T.
;;
;; As currently implemented T is not explicitely in the
;; premises. Instead it is queried directly by the rule's formula.
;; -----------------------------------------------------------------------

(use-modules (srfi srfi-1))

(use-modules (opencog exec))
(use-modules (opencog logger))
(use-modules (opencog distvalue))


(load "instantiation.scm")

(load "../utility.scm")

;;;;;;;;;;;;;;;;;;;;;;;
;; Helper definition ;;
;;;;;;;;;;;;;;;;;;;;;;;

(define implication-full-instantiation-variables
  (VariableList
     (TypedVariableLink
        (VariableNode "$TyVs")
        (TypeChoice
           (TypeNode "TypedVariableLink")
           (TypeNode "VariableList")))
     (VariableNode "$P")
     (VariableNode "$Q")))

(define implication-instantiation-body
	(QuoteLink (ImplicationScopeLink
		(UnquoteLink (VariableNode "$TyVs"))
		(UnquoteLink (VariableNode "$P"))
		(UnquoteLink (VariableNode "$Q")))
    )
)


(define implication-instantiation-precond
	(Evaluation
        (GroundedPredicate "scm: has-dv")
        implication-instantiation-body
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Implication full instantiation rule ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define implication-full-instantiation-rewrite
  (ExecutionOutputLink
     (GroundedSchemaNode "scm: implication-full-instantiation-formula")
     (ListLink
        implication-instantiation-body)))

;; Only try to match an ImplicationScopeLink with a type restricted
;; variable in the ImplicationScopeLink variable definition. The choice of
;; the substitution term is done randomly in
;; implication-full-instantiation-formula. All scoped variables are
;; instantiated.
(define implication-full-instantiation-rule
  (BindLink
     implication-full-instantiation-variables
     (And
		implication-instantiation-body
		implication-instantiation-precond)
     implication-full-instantiation-rewrite))

(define (implication-full-instantiation-formulaa Impl)
  (QuoteLink Impl)
  )

(define (implication-full-instantiation-formula Impl)
  (let* ((key (PredicateNode "CDV"))
         (Impl-cdv (cog-value Impl key))
         ;; Need to turn cdv to dv
         (Impl-c (cog-cdv-get-confidence Impl-cdv))
		 (Impl-outgoings (cog-outgoing-set Impl))
         (TyVs (car Impl-outgoings))
         (P (cadr Impl-outgoings))
         (Q (caddr Impl-outgoings))
         (terms (if (= 0 Impl-c) ; don't try to instantiate zero
                    #f           ; knowledge implication
                    (select-conditioned-substitution-terms TyVs P)))
        )
    (if terms
        ;; Substitute the variables by the terms in P and Q. In P to
        ;; get its TV, in Q cause it's the rule output.
        (let* (
               (Pput (PutLink (LambdaLink TyVs P) terms))
               (Pinst (cog-execute! Pput))
               (Pinst-dv (cog-value Pinst key))
              )
			  (if (not (equal? Pinst-dv '()))
			    (let*
				   ((Qput (PutLink (LambdaLink TyVs Q) terms))
				    (Qinst (cog-execute! Qput))
				    (Qinst-dv (cog-cdv-get-unconditional Impl-cdv Pinst-dv))
				    (Qinst-c (cog-dv-get-confidence Qinst-dv))
                    (old-dv (cog-value Qinst key))
                    (old-dv-c (if (null? old-dv) 0 (cog-dv-get-confidence old-dv)))
                   )

				   ;; Remove the PutLinks to not pollute the atomspace
				   ;; TODO: replace this by something more sensible
				   ;; (extract-hypergraph Pput)
				   ;; (extract-hypergraph Qput)
				   (if (< 0 Qinst-c) ; avoid creating informationless knowledge
                       (update-dv Qinst Qinst-dv)
                   )
				)
			  )
        )
    )
  )
)

;; Name the rule
(define implication-full-instantiation-rule-name
  (DefinedSchemaNode "implication-full-instantiation-rule"))
(DefineLink implication-full-instantiation-rule-name
  implication-full-instantiation-rule)
