(define (square x)
  (* x x)
  )

(define (sum-of-square x y)
  (+ (square x) (square y))
  )

(define (square-sum-of-big-two x y z)
  (cond
    ((and (< x y) (< x z)) (sum-of-square y z))
    ((and (< y z) (< y x)) (sum-of-square x z))
    ((and (< z y) (< z x)) (sum-of-square x y))
    ))

(pretty-print (square-sum-of-big-two 1 2 3))
(pretty-print (square-sum-of-big-two 9 7 8))
