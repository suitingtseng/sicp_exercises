;;;; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3

(define (f-recurse n)
  (cond
    ((< n 3) n)
    (else (+
           (f-recurse (- n 1))
           (* 2 (f-recurse (- n 2)))
           (* 3 (f-recurse (- n 3)))))))

(pretty-print (f-recurse 5))
(pretty-print (f-recurse 10))
(pretty-print (f-recurse 15))
(pretty-print (f-recurse 35)) ; on my macbook pro this takes a while

(define (f-iterate n) (f-imp 2 1 0 n))

(define (f-imp a b c count)
  (cond
    ((= count 0) c)
    (else
     (f-imp (+ a (* 2 b) (* 3 c)) a b (- count 1)))))

(pretty-print (f-iterate 5))
(pretty-print (f-iterate 10))
(pretty-print (f-iterate 15))
(pretty-print (f-iterate 1500)) ; on my macbook pro this is super fast
