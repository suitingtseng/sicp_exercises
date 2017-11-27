(define (print-point p) (printf "(~f, ~f)\n" (x-point p) (y-point p)))


(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-rectangle left-bottom right-top) (cons left-bottom right-top))

(define (left-bottom-point rect) (car rect))

(define (left-top-point rect)
  (make-point (x-point (left-bottom-point rect))
              (y-point (right-top-point rect))))

(define (right-bottom-point rect)
  (make-point (x-point (right-top-point rect))
              (y-point (left-bottom-point rect))))

(define (right-top-point rect) (cdr rect))

(define (left-edge rect)
  (make-segment (left-bottom-point rect)
                (left-top-point rect)))

(define (right-edge rect)
  (make-segment (right-bottom-point rect)
                (right-top-point rect)))

(define (bottom-edge rect)
  (make-segment (left-bottom-point rect)
                (right-bottom-point rect)))

(define (top-edge rect)
  (make-segment (left-top-point rect)
                (right-top-point rect)))

(define (length segment)
  (let ((x-diff (abs (- (x-point (start-segment segment))
                        (x-point (end-segment segment)))))
        (y-diff (abs (- (y-point (start-segment segment))
                        (y-point (end-segment segment))))))
   (sqrt (+ (* x-diff x-diff) (* y-diff y-diff)))))

(define (perimeter rect)
  (+ (length (left-edge rect))
     (length (right-edge rect))
     (length (top-edge rect))
     (length (bottom-edge rect))))

(define (print-perimeter rect)
  (printf "Perimeter: ~f\n" (perimeter rect)))

(define (area rect)
  (* (length (left-edge rect))
     (length (bottom-edge rect))))

(define (print-area rect) (printf "Area: ~f\n" (area rect)))

(define (print-rectangle rect)
  (print-point (left-bottom-point rect))
  (print-point (right-bottom-point rect))
  (print-point (left-top-point rect))
  (print-point (right-top-point rect))
  (print-perimeter rect)
  (print-area rect))

(print-rectangle (make-rectangle (make-point 1 2) (make-point 9 5)))
