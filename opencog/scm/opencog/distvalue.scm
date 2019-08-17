;
; OpenCog Distributional Value Module
; Copyright (C) 2009 Linas Vepstas <linasvepstas@gmail.com>
;

(define-module (opencog distvalue))

(use-modules (opencog distv-config))

(load-extension (string-append opencog-ext-path-distv "libdistv") "opencog_distvalue_init")

(load "distv/types/distv_types.scm")


;(ExecutionOutput
; (GroundedSchema "scm:cog-outgoing-set")
; )
;
;(define (cog-new-dv atom)
; (let* (()
;       )
; )
;)
