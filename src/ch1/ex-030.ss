(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x) (* x x x))

(define (add-one x) (+ x 1))

(pretty-print (sum cube 1 add-one 10))
