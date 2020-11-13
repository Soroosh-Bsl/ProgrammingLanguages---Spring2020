#lang racket
(define (sum-of-list l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sum-of-list (rest l)))]))

(define (max-start-sum l) 
         (cond
           [(= (length l) 1) (car l)]
           [else (max (max-start-sum (reverse (cdr (reverse l)))) (sum-of-list l))]))
                           
(define (main l)
         (cond
           [(= (length l) 1) (car l)]
           [else (max (main (cdr l)) (+ (car l) (max-start-sum (cdr l))))]))

;(max-start-sum '(1 7 -30 40 -10 11 -20 19))
;(main '(4 -5 8 2 -3 13 -6))
;(main '(4 -5 8 2 -3 -13 1000))
;(main '(2 1 4 -42 12 -32 21 83 12))
;(main '(-2 -3 4 -1 -2 1 5 -3))
