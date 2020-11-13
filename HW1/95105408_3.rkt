#lang racket
(define (power order point) (
         cond
          [(= order 0) 1]
          [else (* point (power (+ order -1) point))]))

(define (calc-function coeffs base-order point)(
         cond
          [(= (length coeffs) 0.) 0.]
          [else (+ (* (car coeffs) (power base-order point)) (calc-function (cdr coeffs) (+ base-order 1) point))]
                               ))

(define (calc-integ func-coeffs start-point current-counter max-counter interval) (
         cond
          [(> current-counter max-counter) 0.]
          [else (+ (* interval (calc-function func-coeffs 0. (+ start-point (- (* current-counter interval) (/ interval 2))))) (calc-integ func-coeffs start-point (+ current-counter 1) max-counter interval))]
                                                                          ))

(define (main l) (calc-integ (car l) (second l) 1 (fourth l) (/ (+ (third l) (- (second l))) (fourth l))))

;(power 4 5)
;(calc-function '(1 2 3) 0 2)
;(main '((1 2 3) 1 2 4))
;(main '((2 3 4) 5 6 10))