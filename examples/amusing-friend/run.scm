(load "kb.scm")

(load "pln-config.scm")

(load "helpers.scm")

(define (my-print set)
    (let*
      ((oset (cog-outgoing-set set))
       (dvs (map (lambda (x) (cog-value x key)) oset))
       (res (zip oset dvs))
      )
      (begin
        (display res)
        (display "\n----------------------------------------------------------\n")
      )
    )
)

(define (my-print2 set idx)
    (let*
      ((oset (cog-outgoing-set set))
       (elem (list-ref oset idx))
       (dv (cog-value elem key))
      )
      (begin
        ;(display elem)
        (display dv)
        (display "\n----------------------------------------------------------\n")
      )
    )
)

(display "Res1:\n")
(display (cog-execute! implication-full-instantiation-rule))
;(my-print2 (cog-execute! implication-full-instantiation-rule) 1)

(cog-execute! implication-scope-to-implication-rule)

(display "Res2:\n")
(display (cog-value res2 key))
(display "\n")

(my-print2 (cog-execute! predicate-lambda-evaluation-rule) 3)

(my-print2 (cog-execute! joint-implication-introduction-rule) 3)

(my-print2 (cog-execute! joint-to-implication-second-rule) 0)

(my-print2 (cog-execute! implication-scope-to-implication-rule) 1)

(cog-execute! implication-implicant-conjunction-rule)
(display "Res7:\n")
(display (cog-value res7 key))
(display "\n")

(cog-execute! and-lambda-factorization-double-implication-rule)
(display "Res8:\n")
(display (cog-value res8 key))
(display "\n")

(cog-execute! deduction-implication-rule)
(display "Res9:\n")
(display (cog-value res9 key))
(display "\n")

(cog-execute! implication-to-implication-scope-rule)
(display "Res10:\n")
(display (cog-value res10 key))
(display "\n")

(cog-execute! implication-full-instantiation-rule)
(display "Res11:\n")
(display (cog-value res11 key))
(display "\n")

(display "Res12:\n")
(display (cog-value res12 key))
(display "\n")

(cog-execute! equivalence-scope-distribution-rule)
(display "Res13:\n")
(display (cog-value res13 key))
(display "\n")

(cog-execute! equivalence-to-implication-rule)
(display "Res14:\n")
(display (cog-value res14 key))
(display "\n")

(cog-execute! implication-to-implication-scope-rule)
(display "Res15:\n")
(display (cog-value res15 key))
(display "\n")

(cog-execute! implication-full-instantiation-rule)
(display "Res16:\n")
(display (cog-value res12 key))
(display "\n")

(display "ResX:\n")
(display (cog-value resX key))
(display "\n")

(cog-execute! and-introduction-grounded-evaluation-rule)
(display "Res17:\n")
(display (cog-value res17 key))
(display "\n")
