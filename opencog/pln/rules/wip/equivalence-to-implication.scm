;; =============================================================================
;; EquivalenceToImplicationRule
;;
;; Equivalence
;;    A
;;    B
;; |-
;; Implication
;;    A
;;    B
;; Implication
;;    B
;;    A
;;
;; In practice we only need to provide the rewrite term for
;;
;; Implication
;;    A
;;    B
;;
;; as B->A will automatically be generated due to EquivalenceLink
;; being symmetric.
;; -----------------------------------------------------------------------------

(use-modules (opencog distvalue))

(use-modules (opencog logger))

(load "../utility.scm")

(define equivalence-to-implication-vardecl
  (VariableList
    (Variable "$A")
    (Variable "$B")))

(define equivalence-to-implication-premise
  (Equivalence
    (Variable "$A")
    (Variable "$B")))

(define equivalence-to-implication-precondition
  (EvaluationLink
    (GroundedPredicate "scm: has-dv")
    equivalence-to-implication-premise))

(define equivalence-to-implication-pattern
  (And
    equivalence-to-implication-premise
    equivalence-to-implication-precondition))

(define equivalence-to-implication-conclusion
  (Implication
    (Variable "$A")
    (Variable "$B")))

(define equivalence-to-implication-rewrite
  (ExecutionOutput
    (GroundedSchema "scm: equivalence-to-implication-formula")
      (List
        equivalence-to-implication-conclusion
        equivalence-to-implication-premise)))

(define equivalence-to-implication-rule
  (Bind
    equivalence-to-implication-vardecl
    equivalence-to-implication-pattern
    equivalence-to-implication-rewrite))

(define (equivalence-to-implication-formula AB EQ)
  (let* ((key  (PredicateNode "CDV"))
         (dvEQ (cog-value EQ key))
        )
        (with-simple-cdv AB dvEQ)
  )
)

(define (with-simple-cdv atom dv)
  (let
    ((cdv (cog-new-cdv atom))
     (no-data-dv (cog-new-dv-simple 0.5 0.0001))
    )
    (begin
      (cog-cdv-add-evidence cdv (FloatValue 0) no-data-dv)
      (cog-cdv-add-evidence cdv (FloatValue 1) dv)
      (update-cdv atom cdv)
    )
  )
)
;(define (equivalence-to-implication-formula AB EQ)
;  (let* ((A (gar AB))
;         (B (gdr AB))
;         (sA (cog-dv-get-swc A))
;         (sB (cog-dv-get-swc B))
;         (sEQ (cog-stv-strength EQ))
;         (cEQ (cog-stv-confidence EQ))
;         (sAB (if (< 0.99 (* sEQ cEQ)) ; Hack to work around the
;                                       ; lack of distributional
;                                       ; TV. If sEQ is high enough,
;                                       ; we just set sAB as sEQ
;                  sEQ
;                  ;; Formula based on PLN book formula for sim2inh
;                  (/ (* (+ 1 (/ sB sA)) sEQ) (+ 1 sEQ)))))
;    (if (< 0 cEQ)                       ;
;        (cog-merge-hi-conf-tv! AB (stv sAB cEQ)))))

;; Name the rule
(define equivalence-to-implication-rule-name
  (DefinedSchema "equivalence-to-implication-rule"))
(Define
  equivalence-to-implication-rule-name
  equivalence-to-implication-rule)
