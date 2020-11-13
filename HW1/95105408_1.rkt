#lang racket
(define (atom? x) (not (pair? x)))
(define(main l) (
       cond
           [(atom? l) l]
           [(empty? l) '()]
           [else (append (main (cdr l)) (list (main (car l))))]))

;(main '(1 2 3))
;(main '(1 (2 3)))
;(main '(1 (2 3) ("Hassan" "Mamad" "Ali") (#t #f) 8 9 "Soroosh"))
;(main '(1 (2 (3 4 (5 6 (7 8))))))