;; Like moses-pln-synergy-pm.scm but this version relies on the
;; forward chainer.

;; Load the background knowledge
(load "kb.scm")

;; Load the PLN configuration for this demo
(load "pln-config.scm")
(load "helpers.scm")

(ure-logger-set-level! "debug")

(pln-fc (SetLink people-telling-the-truth-are-honest
                 friends-tend-to-be-honest
                 human-acquainted-tend-to-become-friends
                 people-telling-jokes-are-funny
                 funny-is-loosely-equivalent-to-amusing))

(display "Res51:\n")
(display (cog-value res51 key))
(display "\n")
(display "Res52:\n")
(display (cog-value res52 key))
(display "\n")

(display "Res7:\n")
(display (cog-value res7 key))
(display "\n")

(display "Res8:\n")
(display (cog-value res8 key))
(display "\n")

(display "Res9:\n")
(display (cog-value res9 key))
(display "\n")

(display "Res10:\n")
(display (cog-value res10 key))
(display "\n")

(display "Res11:\n")
(display (cog-value res11 key))
(display "\n")

(display "Res12:\n")
(display (cog-value res12 key))
(display "\n")

(display "Res13:\n")
(display (cog-value res13 key))
(display "\n")

(display "Res14:\n")
(display (cog-value res14 key))
(display "\n")

(display "Res15:\n")
(display (cog-value res15 key))
(display "\n")

(display "Res16:\n")
(display (cog-value res16 key))
(display "\n")

(display "Res17:\n")
(display (cog-value res17 key))
(display "\n")
