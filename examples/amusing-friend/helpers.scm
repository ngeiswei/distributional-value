
(use-modules (opencog distvalue))

(define res2
(Implication
   (Lambda
      (VariableList
         (TypedVariable
            (Variable "$X")
            (Type "ConceptNode"))
         (TypedVariable
            (Variable "$Y")
            (Type "ConceptNode")))
      (Evaluation
         (Predicate "will-be-friends")
         (List
            (Variable "$X")
            (Variable "$Y"))))
   (Lambda
      (VariableList
         (TypedVariable
            (Variable "$X")
            (Type "ConceptNode"))
         (TypedVariable
            (Variable "$Y")
            (Type "ConceptNode")))
      (And
         (Evaluation
            (Predicate "is-honest")
            (Variable "$X"))
         (Evaluation
            (Predicate "is-honest")
            (Variable "$Y")))))
)

(define res3
 (Lambda
    (VariableList
       (TypedVariable
          (Variable "$X")
          (Type "ConceptNode"))
       (TypedVariable
          (Variable "$Y")
          (Type "ConceptNode")))
    (Evaluation
       (Predicate "will-be-friends")
       (List
          (Variable "$X")
          (Variable "$Y")))))

(define res51
(ProductLink
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (EvaluationLink
         (PredicateNode "will-be-friends")
         (ListLink
            (VariableNode "$X")
            (VariableNode "$Y")
         )
      )
   )
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (AndLink
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$Y")
         )
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$X")
         )
      )
   )
))

(define res52
(ImplicationLink
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (AndLink
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$Y")
         )
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$X")
         )
      )
   )
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (EvaluationLink
         (PredicateNode "will-be-friends")
         (ListLink
            (VariableNode "$X")
            (VariableNode "$Y")
         )
      )
   )
))

(define res6
 (Implication
    (LambdaLink
       (VariableList
          (TypedVariable
             (Variable "$X")
             (Type "ConceptNode"))
          (TypedVariable
             (Variable "$Y")
             (Type "ConceptNode")))
       (And
          (Inheritance
             (Variable "$X")
             (Concept "human"))
          (Inheritance
             (Variable "$Y")
             (Concept "human"))
          (Evaluation
             (Predicate "acquainted")
             (List
                (Variable "$X")
                (Variable "$Y")))))
    (LambdaLink
       (VariableList
          (TypedVariable
             (Variable "$X")
             (Type "ConceptNode"))
          (TypedVariable
             (Variable "$Y")
             (Type "ConceptNode")))
       (Evaluation
          (Predicate "will-be-friends")
          (List
             (Variable "$X")
             (Variable "$Y")))))
 )

;(define res7_1
;   (ImplicationLink
;      (AndLink
;         (LambdaLink
;            (VariableList
;               (TypedVariableLink
;                  (VariableNode "$X")
;                  (TypeNode "ConceptNode")
;               )
;               (TypedVariableLink
;                  (VariableNode "$Y")
;                  (TypeNode "ConceptNode")
;               )
;            )
;            (AndLink
;               (EvaluationLink
;                  (PredicateNode "is-honest")
;                  (VariableNode "$Y")
;               )
;               (EvaluationLink
;                  (PredicateNode "is-honest")
;                  (VariableNode "$X")
;               )
;            )
;         )
;         (LambdaLink
;            (VariableList
;               (TypedVariableLink
;                  (VariableNode "$X")
;                  (TypeNode "ConceptNode")
;               )
;               (TypedVariableLink
;                  (VariableNode "$Y")
;                  (TypeNode "ConceptNode")
;               )
;            )
;            (EvaluationLink
;               (PredicateNode "will-be-friends")
;               (ListLink
;                  (VariableNode "$Y")
;                  (VariableNode "$X")
;               )
;            )
;         )
;      )
;      (LambdaLink
;         (VariableList
;            (TypedVariableLink
;               (VariableNode "$X")
;               (TypeNode "ConceptNode")
;            )
;            (TypedVariableLink
;               (VariableNode "$Y")
;               (TypeNode "ConceptNode")
;            )
;         )
;         (EvaluationLink
;            (PredicateNode "will-be-friends")
;            (ListLink
;               (VariableNode "$X")
;               (VariableNode "$Y")
;            )
;         )
;      )
;   ))
;(define res7_2
;   (ImplicationLink
;      (AndLink
;         (LambdaLink
;            (VariableList
;               (TypedVariableLink
;                  (VariableNode "$X")
;                  (TypeNode "ConceptNode")
;               )
;               (TypedVariableLink
;                  (VariableNode "$Y")
;                  (TypeNode "ConceptNode")
;               )
;            )
;            (AndLink
;               (EvaluationLink
;                  (PredicateNode "is-honest")
;                  (VariableNode "$Y")
;               )
;               (EvaluationLink
;                  (PredicateNode "is-honest")
;                  (VariableNode "$X")
;               )
;            )
;         )
;         (LambdaLink
;            (VariableList
;               (TypedVariableLink
;                  (VariableNode "$X")
;                  (TypeNode "ConceptNode")
;               )
;               (TypedVariableLink
;                  (VariableNode "$Y")
;                  (TypeNode "ConceptNode")
;               )
;            )
;            (AndLink
;               (InheritanceLink
;                  (VariableNode "$X")
;                  (ConceptNode "human")
;               )
;               (EvaluationLink
;                  (PredicateNode "acquainted")
;                  (ListLink
;                     (VariableNode "$X")
;                     (VariableNode "$Y")
;                  )
;               )
;               (InheritanceLink
;                  (VariableNode "$Y")
;                  (ConceptNode "human")
;               )
;            )
;         )
;      )
;      (LambdaLink
;         (VariableList
;            (TypedVariableLink
;               (VariableNode "$X")
;               (TypeNode "ConceptNode")
;            )
;            (TypedVariableLink
;               (VariableNode "$Y")
;               (TypeNode "ConceptNode")
;            )
;         )
;         (EvaluationLink
;            (PredicateNode "will-be-friends")
;            (ListLink
;               (VariableNode "$X")
;               (VariableNode "$Y")
;            )
;         )
;      )
;   ))
(define res7_3
   (ImplicationLink
      (AndLink
         (LambdaLink
            (VariableList
               (TypedVariableLink
                  (VariableNode "$X")
                  (TypeNode "ConceptNode")
               )
               (TypedVariableLink
                  (VariableNode "$Y")
                  (TypeNode "ConceptNode")
               )
            )
            (EvaluationLink
               (PredicateNode "will-be-friends")
               (ListLink
                  (VariableNode "$Y")
                  (VariableNode "$X")
               )
            )
         )
         (LambdaLink
            (VariableList
               (TypedVariableLink
                  (VariableNode "$X")
                  (TypeNode "ConceptNode")
               )
               (TypedVariableLink
                  (VariableNode "$Y")
                  (TypeNode "ConceptNode")
               )
            )
            (AndLink
               (InheritanceLink
                  (VariableNode "$X")
                  (ConceptNode "human")
               )
               (EvaluationLink
                  (PredicateNode "acquainted")
                  (ListLink
                     (VariableNode "$X")
                     (VariableNode "$Y")
                  )
               )
               (InheritanceLink
                  (VariableNode "$Y")
                  (ConceptNode "human")
               )
            )
         )
      )
      (LambdaLink
         (VariableList
            (TypedVariableLink
               (VariableNode "$X")
               (TypeNode "ConceptNode")
            )
            (TypedVariableLink
               (VariableNode "$Y")
               (TypeNode "ConceptNode")
            )
         )
         (EvaluationLink
            (PredicateNode "will-be-friends")
            (ListLink
               (VariableNode "$X")
               (VariableNode "$Y")
            )
         )
      )
   ))

(define res7
 (ImplicationLink
    (AndLink
       (LambdaLink
          (VariableList
             (TypedVariableLink
                (VariableNode "$X")
                (TypeNode "ConceptNode")
             )
             (TypedVariableLink
                (VariableNode "$Y")
                (TypeNode "ConceptNode")
             )
          )
          (AndLink
             (EvaluationLink
                (PredicateNode "is-honest")
                (VariableNode "$X")
             )
             (EvaluationLink
                (PredicateNode "is-honest")
                (VariableNode "$Y")
             )
          )
       )
       (LambdaLink
          (VariableList
             (TypedVariableLink
                (VariableNode "$X")
                (TypeNode "ConceptNode")
             )
             (TypedVariableLink
                (VariableNode "$Y")
                (TypeNode "ConceptNode")
             )
          )
          (AndLink
             (InheritanceLink
                (VariableNode "$X")
                (ConceptNode "human")
             )
             (InheritanceLink
                (VariableNode "$Y")
                (ConceptNode "human")
             )
             (EvaluationLink
                (PredicateNode "acquainted")
                (ListLink
                   (VariableNode "$X")
                   (VariableNode "$Y")
                )
             )
          )
       )
    )
    (LambdaLink
       (VariableList
          (TypedVariableLink
             (VariableNode "$X")
             (TypeNode "ConceptNode")
          )
          (TypedVariableLink
             (VariableNode "$Y")
             (TypeNode "ConceptNode")
          )
       )
       (EvaluationLink
          (PredicateNode "will-be-friends")
          (ListLink
             (VariableNode "$X")
             (VariableNode "$Y")
          )
       )
    )
))

(define res8-old
(ImplicationLink
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (ProductLink
        (AndLink
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$X")
         )
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$Y")
         )
        )
        (AndLink
         (InheritanceLink
            (VariableNode "$X")
            (ConceptNode "human")
         )
         (InheritanceLink
            (VariableNode "$Y")
            (ConceptNode "human")
         )
         (EvaluationLink
            (PredicateNode "acquainted")
            (ListLink
               (VariableNode "$X")
               (VariableNode "$Y")
            )
         )
        )
      )
   )
   (ProductLink
      (LambdaLink
         (VariableList
            (TypedVariableLink
               (VariableNode "$X")
               (TypeNode "ConceptNode")
            )
            (TypedVariableLink
               (VariableNode "$Y")
               (TypeNode "ConceptNode")
            )
         )
         (AndLink
            (EvaluationLink
               (PredicateNode "is-honest")
               (VariableNode "$X")
            )
            (EvaluationLink
               (PredicateNode "is-honest")
               (VariableNode "$Y")
            )
         )
      )
      (LambdaLink
         (VariableList
            (TypedVariableLink
               (VariableNode "$X")
               (TypeNode "ConceptNode")
            )
            (TypedVariableLink
               (VariableNode "$Y")
               (TypeNode "ConceptNode")
            )
         )
         (AndLink
            (InheritanceLink
               (VariableNode "$X")
               (ConceptNode "human")
            )
            (InheritanceLink
               (VariableNode "$Y")
               (ConceptNode "human")
            )
            (EvaluationLink
               (PredicateNode "acquainted")
               (ListLink
                  (VariableNode "$X")
                  (VariableNode "$Y")
               )
            )
         )
      )
   )
))

(define res8
(ImplicationLink
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (AndLink
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$X")
         )
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$Y")
         )
         (InheritanceLink
            (VariableNode "$X")
            (ConceptNode "human")
         )
         (InheritanceLink
            (VariableNode "$Y")
            (ConceptNode "human")
         )
         (EvaluationLink
            (PredicateNode "acquainted")
            (ListLink
               (VariableNode "$X")
               (VariableNode "$Y")
            )
         )
      )
   )
   (AndLink
      (LambdaLink
         (VariableList
            (TypedVariableLink
               (VariableNode "$X")
               (TypeNode "ConceptNode")
            )
            (TypedVariableLink
               (VariableNode "$Y")
               (TypeNode "ConceptNode")
            )
         )
         (AndLink
            (EvaluationLink
               (PredicateNode "is-honest")
               (VariableNode "$X")
            )
            (EvaluationLink
               (PredicateNode "is-honest")
               (VariableNode "$Y")
            )
         )
      )
      (LambdaLink
         (VariableList
            (TypedVariableLink
               (VariableNode "$X")
               (TypeNode "ConceptNode")
            )
            (TypedVariableLink
               (VariableNode "$Y")
               (TypeNode "ConceptNode")
            )
         )
         (AndLink
            (InheritanceLink
               (VariableNode "$X")
               (ConceptNode "human")
            )
            (InheritanceLink
               (VariableNode "$Y")
               (ConceptNode "human")
            )
            (EvaluationLink
               (PredicateNode "acquainted")
               (ListLink
                  (VariableNode "$X")
                  (VariableNode "$Y")
               )
            )
         )
      )
   )
))

(define res9-old
(ImplicationLink
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (ProductLink
          (AndLink
             (EvaluationLink
                (PredicateNode "is-honest")
                (VariableNode "$X")
             )
             (EvaluationLink
                (PredicateNode "is-honest")
                (VariableNode "$Y")
             )
          )
          (AndLink
             (InheritanceLink
                (VariableNode "$Y")
                (ConceptNode "human")
             )
             (EvaluationLink
                (PredicateNode "acquainted")
                (ListLink
                   (VariableNode "$X")
                   (VariableNode "$Y")
                )
             )
             (InheritanceLink
                (VariableNode "$X")
                (ConceptNode "human")
             )
          )
      )
   )
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (EvaluationLink
         (PredicateNode "will-be-friends")
         (ListLink
            (VariableNode "$X")
            (VariableNode "$Y")
         )
      )
   )
))

(define res9
(ImplicationLink
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (AndLink
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$X")
         )
         (EvaluationLink
            (PredicateNode "is-honest")
            (VariableNode "$Y")
         )
         (InheritanceLink
            (VariableNode "$Y")
            (ConceptNode "human")
         )
         (EvaluationLink
            (PredicateNode "acquainted")
            (ListLink
               (VariableNode "$X")
               (VariableNode "$Y")
            )
         )
         (InheritanceLink
            (VariableNode "$X")
            (ConceptNode "human")
         )
      )
   )
   (LambdaLink
      (VariableList
         (TypedVariableLink
            (VariableNode "$X")
            (TypeNode "ConceptNode")
         )
         (TypedVariableLink
            (VariableNode "$Y")
            (TypeNode "ConceptNode")
         )
      )
      (EvaluationLink
         (PredicateNode "will-be-friends")
         (ListLink
            (VariableNode "$X")
            (VariableNode "$Y")
         )
      )
   )
))

(define res10old
(ImplicationScopeLink
   (VariableList
      (TypedVariableLink
         (VariableNode "$X")
         (TypeNode "ConceptNode")
      )
      (TypedVariableLink
         (VariableNode "$Y")
         (TypeNode "ConceptNode")
      )
   )
   (ProductLink
       (AndLink
          (EvaluationLink
             (PredicateNode "is-honest")
             (VariableNode "$X")
          )
          (EvaluationLink
             (PredicateNode "is-honest")
             (VariableNode "$Y")
          )
       )
       (AndLink
          (InheritanceLink
             (VariableNode "$X")
             (ConceptNode "human")
          )
          (EvaluationLink
             (PredicateNode "acquainted")
             (ListLink
                (VariableNode "$X")
                (VariableNode "$Y")
             )
          )
          (InheritanceLink
             (VariableNode "$Y")
             (ConceptNode "human")
          )
       )
   )
   (EvaluationLink
      (PredicateNode "will-be-friends")
      (ListLink
         (VariableNode "$X")
         (VariableNode "$Y")
      )
   )
))

(define res10
(ImplicationScopeLink
   (VariableList
      (TypedVariableLink
         (VariableNode "$X")
         (TypeNode "ConceptNode")
      )
      (TypedVariableLink
         (VariableNode "$Y")
         (TypeNode "ConceptNode")
      )
   )
   (AndLink
      (EvaluationLink
         (PredicateNode "is-honest")
         (VariableNode "$X")
      )
      (EvaluationLink
         (PredicateNode "is-honest")
         (VariableNode "$Y")
      )
      (InheritanceLink
         (VariableNode "$X")
         (ConceptNode "human")
      )
      (EvaluationLink
         (PredicateNode "acquainted")
         (ListLink
            (VariableNode "$X")
            (VariableNode "$Y")
         )
      )
      (InheritanceLink
         (VariableNode "$Y")
         (ConceptNode "human")
      )
   )
   (EvaluationLink
      (PredicateNode "will-be-friends")
      (ListLink
         (VariableNode "$X")
         (VariableNode "$Y")
      )
   )
))

(define res11
(EvaluationLink
   (PredicateNode "will-be-friends")
   (ListLink
      (ConceptNode "Self")
      (ConceptNode "Bob")
   )
))

(define res12
(Evaluation
  (Predicate "is-funny")
  (Concept "Bob"))
)

(define res13
 (Equivalence
    (Lambda
       (TypedVariable
          (Variable "$X")
          (Type "ConceptNode"))
       (Evaluation
          (Predicate "is-funny")
          (Variable "$X")))
    (Lambda
       (TypedVariable
          (Variable "$X")
          (Type "ConceptNode"))
       (Evaluation
          (Predicate "is-amusing")
          (Variable "$X"))))
)

(define res14
 (Implication
    (Lambda
       (TypedVariable
          (Variable "$X")
          (Type "ConceptNode"))
       (Evaluation
          (Predicate "is-funny")
          (Variable "$X")))
    (Lambda
       (TypedVariable
          (Variable "$X")
          (Type "ConceptNode"))
       (Evaluation
          (Predicate "is-amusing")
          (Variable "$X"))))
)

(define res15
 (ImplicationScopeLink
    (TypedVariableLink
       (VariableNode "$X")
       (TypeNode "ConceptNode")
    )
    (EvaluationLink
       (PredicateNode "is-funny")
       (VariableNode "$X")
    )
    (EvaluationLink
       (PredicateNode "is-amusing")
       (VariableNode "$X")
    )
 )
)

(define res16
(Evaluation
  (Predicate "is-amusing")
  (Concept "Bob"))
)

(define resX
(Evaluation
  (Predicate "is-honest")
  (Concept "Bob"))
)

(define res17
(And
   (Evaluation
      (Predicate "will-be-friends")
      (List
         (Concept "Self")
         (Concept "Bob")))
   (Evaluation
      (Predicate "is-honest")
      (Concept "Bob"))
   (Evaluation
      (Predicate "is-amusing")
      (Concept "Bob")))
)

(define rule
(BindLink
    (TypedVariableLink
      (VariableNode "$C-7005b724") ; [7287740910861908098][-1]
      (TypeChoice
        (TypeNode "PredicateNode") ; [7305598356597613522][-1]
        (TypeNode "ProductLink") ; [975071370727209098][-1]
        (TypeNode "AndLink") ; [5151098898080091339][-1]
        (TypeNode "OrLink") ; [1641306484157085050][-1]
        (TypeNode "NotLink") ; [7029459189045098133][-1]
        (TypeNode "LambdaLink") ; [6352564234594770035][-1]
      ) ; [10511657528113879540][-1]
    ) ; [10713532622688443548][-1]
    (AndLink
      (EvaluationLink
        (GroundedPredicateNode "scm: has-dv") ; [1626887775938174772][1]
        (ImplicationLink
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$Y") ; [5319137675165988851][1]
              ) ; [11316233410364065027][-1]
              (InheritanceLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [13543884048985969026][-1]
              (EvaluationLink
                (PredicateNode "acquainted") ; [1423824971342960383][1]
                (ListLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [10610844603179128165][-1]
              ) ; [15017241748538891864][-1]
              (InheritanceLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [15290389661272482324][-1]
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$X") ; [6809970978681772822][1]
              ) ; [18027048578613448587][-1]
            ) ; [10026832390293712206][-1]
          ) ; [15755525834399214605][-1]
          (AndLink
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                (TypedVariableLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (EvaluationLink
                  (PredicateNode "is-honest") ; [896491674635673564][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [11316233410364065027][-1]
                (EvaluationLink
                  (PredicateNode "is-honest") ; [896491674635673564][1]
                  (VariableNode "$X") ; [6809970978681772822][1]
                ) ; [18027048578613448587][-1]
              ) ; [17301737211913726717][-1]
            ) ; [9633511462606239528][-1]
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                (TypedVariableLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (InheritanceLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [13543884048985969026][-1]
                (EvaluationLink
                  (PredicateNode "acquainted") ; [1423824971342960383][1]
                  (ListLink
                    (VariableNode "$X") ; [6809970978681772822][1]
                    (VariableNode "$Y") ; [5319137675165988851][1]
                  ) ; [10610844603179128165][-1]
                ) ; [15017241748538891864][-1]
                (InheritanceLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [15290389661272482324][-1]
              ) ; [16072664192254282517][-1]
            ) ; [15760365508524188630][-1]
          ) ; [14565801570177859310][-1]
        ) ; [14006043824130708655][-1]
      ) ; [12927508010983492772][-1]
      (NotLink
        (IdenticalLink
          (VariableNode "$C-7005b724") ; [7287740910861908098][-1]
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$Y") ; [5319137675165988851][1]
              ) ; [11316233410364065027][-1]
              (InheritanceLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [13543884048985969026][-1]
              (EvaluationLink
                (PredicateNode "acquainted") ; [1423824971342960383][1]
                (ListLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [10610844603179128165][-1]
              ) ; [15017241748538891864][-1]
              (InheritanceLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [15290389661272482324][-1]
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$X") ; [6809970978681772822][1]
              ) ; [18027048578613448587][-1]
            ) ; [10026832390293712206][-1]
          ) ; [15755525834399214605][-1]
        ) ; [15270868094969754487][-1]
      ) ; [13438073708548334434][-1]
      (ImplicationLink
        (LambdaLink
          (VariableList
            (TypedVariableLink
              (VariableNode "$X") ; [6809970978681772822][1]
              (TypeNode "ConceptNode") ; [3788493803782518958][1]
            ) ; [15439747438434368500][-1]
            (TypedVariableLink
              (VariableNode "$Y") ; [5319137675165988851][1]
              (TypeNode "ConceptNode") ; [3788493803782518958][1]
            ) ; [18339299357395184868][-1]
          ) ; [18221820312173157523][-1]
          (AndLink
            (EvaluationLink
              (PredicateNode "is-honest") ; [896491674635673564][1]
              (VariableNode "$Y") ; [5319137675165988851][1]
            ) ; [11316233410364065027][-1]
            (InheritanceLink
              (VariableNode "$X") ; [6809970978681772822][1]
              (ConceptNode "human") ; [7041181808330050715][1]
            ) ; [13543884048985969026][-1]
            (EvaluationLink
              (PredicateNode "acquainted") ; [1423824971342960383][1]
              (ListLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (VariableNode "$Y") ; [5319137675165988851][1]
              ) ; [10610844603179128165][-1]
            ) ; [15017241748538891864][-1]
            (InheritanceLink
              (VariableNode "$Y") ; [5319137675165988851][1]
              (ConceptNode "human") ; [7041181808330050715][1]
            ) ; [15290389661272482324][-1]
            (EvaluationLink
              (PredicateNode "is-honest") ; [896491674635673564][1]
              (VariableNode "$X") ; [6809970978681772822][1]
            ) ; [18027048578613448587][-1]
          ) ; [10026832390293712206][-1]
        ) ; [15755525834399214605][-1]
        (AndLink
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$Y") ; [5319137675165988851][1]
              ) ; [11316233410364065027][-1]
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$X") ; [6809970978681772822][1]
              ) ; [18027048578613448587][-1]
            ) ; [17301737211913726717][-1]
          ) ; [9633511462606239528][-1]
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (InheritanceLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [13543884048985969026][-1]
              (EvaluationLink
                (PredicateNode "acquainted") ; [1423824971342960383][1]
                (ListLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [10610844603179128165][-1]
              ) ; [15017241748538891864][-1]
              (InheritanceLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [15290389661272482324][-1]
            ) ; [16072664192254282517][-1]
          ) ; [15760365508524188630][-1]
        ) ; [14565801570177859310][-1]
      ) ; [14006043824130708655][-1]
      (ImplicationLink
        (AndLink
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$Y") ; [5319137675165988851][1]
              ) ; [11316233410364065027][-1]
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$X") ; [6809970978681772822][1]
              ) ; [18027048578613448587][-1]
            ) ; [17301737211913726717][-1]
          ) ; [9633511462606239528][-1]
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (InheritanceLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [13543884048985969026][-1]
              (EvaluationLink
                (PredicateNode "acquainted") ; [1423824971342960383][1]
                (ListLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [10610844603179128165][-1]
              ) ; [15017241748538891864][-1]
              (InheritanceLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [15290389661272482324][-1]
            ) ; [16072664192254282517][-1]
          ) ; [15760365508524188630][-1]
        ) ; [14565801570177859310][-1]
        (VariableNode "$C-7005b724") ; [7287740910861908098][-1]
      ) ; [14445992559969654376][-1]
      (EvaluationLink
        (GroundedPredicateNode "scm: has-dv") ; [1626887775938174772][1]
        (ImplicationLink
          (AndLink
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                (TypedVariableLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (EvaluationLink
                  (PredicateNode "is-honest") ; [896491674635673564][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [11316233410364065027][-1]
                (EvaluationLink
                  (PredicateNode "is-honest") ; [896491674635673564][1]
                  (VariableNode "$X") ; [6809970978681772822][1]
                ) ; [18027048578613448587][-1]
              ) ; [17301737211913726717][-1]
            ) ; [9633511462606239528][-1]
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                (TypedVariableLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (InheritanceLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [13543884048985969026][-1]
                (EvaluationLink
                  (PredicateNode "acquainted") ; [1423824971342960383][1]
                  (ListLink
                    (VariableNode "$X") ; [6809970978681772822][1]
                    (VariableNode "$Y") ; [5319137675165988851][1]
                  ) ; [10610844603179128165][-1]
                ) ; [15017241748538891864][-1]
                (InheritanceLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [15290389661272482324][-1]
              ) ; [16072664192254282517][-1]
            ) ; [15760365508524188630][-1]
          ) ; [14565801570177859310][-1]
          (VariableNode "$C-7005b724") ; [7287740910861908098][-1]
        ) ; [14445992559969654376][-1]
      ) ; [15710659353125910412][-1]
    ) ; [10068898761926163358][-1]
    (ExecutionOutputLink
      (GroundedSchemaNode "scm: deduction-formula") ; [202014246054215509][1]
      (ListLink
        (ImplicationLink
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$Y") ; [5319137675165988851][1]
              ) ; [11316233410364065027][-1]
              (InheritanceLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [13543884048985969026][-1]
              (EvaluationLink
                (PredicateNode "acquainted") ; [1423824971342960383][1]
                (ListLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [10610844603179128165][-1]
              ) ; [15017241748538891864][-1]
              (InheritanceLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [15290389661272482324][-1]
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$X") ; [6809970978681772822][1]
              ) ; [18027048578613448587][-1]
            ) ; [10026832390293712206][-1]
          ) ; [15755525834399214605][-1]
          (VariableNode "$C-7005b724") ; [7287740910861908098][-1]
        ) ; [14265257743491673897][-1]
        (ImplicationLink
          (LambdaLink
            (VariableList
              (TypedVariableLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [15439747438434368500][-1]
              (TypedVariableLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (TypeNode "ConceptNode") ; [3788493803782518958][1]
              ) ; [18339299357395184868][-1]
            ) ; [18221820312173157523][-1]
            (AndLink
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$Y") ; [5319137675165988851][1]
              ) ; [11316233410364065027][-1]
              (InheritanceLink
                (VariableNode "$X") ; [6809970978681772822][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [13543884048985969026][-1]
              (EvaluationLink
                (PredicateNode "acquainted") ; [1423824971342960383][1]
                (ListLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [10610844603179128165][-1]
              ) ; [15017241748538891864][-1]
              (InheritanceLink
                (VariableNode "$Y") ; [5319137675165988851][1]
                (ConceptNode "human") ; [7041181808330050715][1]
              ) ; [15290389661272482324][-1]
              (EvaluationLink
                (PredicateNode "is-honest") ; [896491674635673564][1]
                (VariableNode "$X") ; [6809970978681772822][1]
              ) ; [18027048578613448587][-1]
            ) ; [10026832390293712206][-1]
          ) ; [15755525834399214605][-1]
          (AndLink
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                (TypedVariableLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (EvaluationLink
                  (PredicateNode "is-honest") ; [896491674635673564][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [11316233410364065027][-1]
                (EvaluationLink
                  (PredicateNode "is-honest") ; [896491674635673564][1]
                  (VariableNode "$X") ; [6809970978681772822][1]
                ) ; [18027048578613448587][-1]
              ) ; [17301737211913726717][-1]
            ) ; [9633511462606239528][-1]
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                (TypedVariableLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (InheritanceLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [13543884048985969026][-1]
                (EvaluationLink
                  (PredicateNode "acquainted") ; [1423824971342960383][1]
                  (ListLink
                    (VariableNode "$X") ; [6809970978681772822][1]
                    (VariableNode "$Y") ; [5319137675165988851][1]
                  ) ; [10610844603179128165][-1]
                ) ; [15017241748538891864][-1]
                (InheritanceLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [15290389661272482324][-1]
              ) ; [16072664192254282517][-1]
            ) ; [15760365508524188630][-1]
          ) ; [14565801570177859310][-1]
        ) ; [14006043824130708655][-1]
        (ImplicationLink
          (AndLink
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                ;(TypedVariableLink
                ;  (VariableNode "$Y") ; [5319137675165988851][1]
                ;  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ;) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (EvaluationLink
                  (PredicateNode "is-honest") ; [896491674635673564][1]
                  (VariableNode "$Y") ; [5319137675165988851][1]
                ) ; [11316233410364065027][-1]
                ;(EvaluationLink
                ;  (PredicateNode "is-honest") ; [896491674635673564][1]
                ;  (VariableNode "$X") ; [6809970978681772822][1]
                ;) ; [18027048578613448587][-1]
              ) ; [17301737211913726717][-1]
            ) ; [9633511462606239528][-1]
            (LambdaLink
              (VariableList
                (TypedVariableLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [15439747438434368500][-1]
                (TypedVariableLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (TypeNode "ConceptNode") ; [3788493803782518958][1]
                ) ; [18339299357395184868][-1]
              ) ; [18221820312173157523][-1]
              (AndLink
                (InheritanceLink
                  (VariableNode "$X") ; [6809970978681772822][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [13543884048985969026][-1]
                (EvaluationLink
                  (PredicateNode "acquainted") ; [1423824971342960383][1]
                  (ListLink
                    (VariableNode "$X") ; [6809970978681772822][1]
                    (VariableNode "$Y") ; [5319137675165988851][1]
                  ) ; [10610844603179128165][-1]
                ) ; [15017241748538891864][-1]
                (InheritanceLink
                  (VariableNode "$Y") ; [5319137675165988851][1]
                  (ConceptNode "human") ; [7041181808330050715][1]
                ) ; [15290389661272482324][-1]
              ) ; [16072664192254282517][-1]
            ) ; [15760365508524188630][-1]
          ) ; [14565801570177859310][-1]
          (VariableNode "$C-7005b724") ; [7287740910861908098][-1]
        ) ; [14445992559969654376][-1]
      ) ; [17833602047355866887][-1]
    ) ; [16120951406949915487][-1]
  ))
