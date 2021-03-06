(define (make-interval a b) (cons a b))

(define (lower-bound i) (min (car i) (cdr i)))

(define (upper-bound i) (max (car i) (cdr i)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
 (mul-interval x
               (make-interval
                (/ 1.0 (upper-bound y))
                (/ 1.0 (lower-bound y)))))

(define (print-interval i) (printf "~f ~~ ~f\n" (lower-bound i) (upper-bound i)))

(print-interval (make-interval 1 2))
(print-interval (add-interval (make-interval 3 5) (make-interval 7 8)))
(print-interval (mul-interval (make-interval 3 5) (make-interval 7 8)))
(print-interval (div-interval (make-interval 3 5) (make-interval 7 8)))
