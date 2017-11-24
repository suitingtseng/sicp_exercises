(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a accu)
    (if (> a b)
        accu
        (iter (next a) (combiner accu (term a)))))
  (iter a null-value))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))

(define (sum term a next b) (accumulate-iterative + 0 term a next b))

(define (product term a next b) (accumulate-recursive * 1 term a next b))

(define (add-one x) (+ x 1))

(define (identity x) x)

(pretty-print (sum identity 1 add-one 10))
(pretty-print (product identity 1 add-one 10))
