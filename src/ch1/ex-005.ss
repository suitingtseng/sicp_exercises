(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
;; in applicative model this should be infinite loop because p returns itself.
;; in normal order this should be 0 because there is no need to evaluate (p).
