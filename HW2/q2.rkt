#lang eopl

(define remove
  (lambda (val list)
    (if (null? list)
        '()
        (if (eqv? (car list) val)
            (remove val (cdr list))
            (cons (car list) (remove val (cdr list)))))))

;(display (remove 2 '(1 2 3 4 2 5 6 7 2)))