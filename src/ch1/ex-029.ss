(define (simpson-integral f a b n)
  (define dx (/ (- b a) n))
  (define (add-dx x) (+ x dx))
  (define (g x)
    (* (f x)
       (cond
         ((or (= x a) (= x b)) 1)
         ((even? (/ (- x a) dx)) 2)
         (else 4))))
  (* (sum g a add-dx b)
     (/ dx 3)))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (even? x) (= 0 (remainder x 2)))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(pretty-print (integral cube 0 1 0.01))
(pretty-print (simpson-integral cube 0 1 100))
(pretty-print (simpson-integral cube 0 1 1000))
(pretty-print (simpson-integral cube 0 1 10000))
