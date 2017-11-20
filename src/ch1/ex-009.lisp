(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))
;; this is recursive

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))
;; this is iterative
