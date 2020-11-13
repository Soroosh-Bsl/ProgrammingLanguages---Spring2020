#lang eopl

(define empty-stack
  (lambda ()
    (lambda (m)
      (cond
        ((eqv? m 'top) (eopl:error m "Empty stack")))
        ((eqv? m 'empty-stack?) #t)
        ((eqv? m 'pop) (eopl:error m "Empty stack"))
        (else (eopl:error m "Invalid method"))))))

(define push
  (lambda (val stack)
    (lambda (m)
      (cond
        ((eqv? m 'top) val)
        ((eqv? m 'empty-stack?) #f)
        ((eqv? m 'pop) stack)
        (else (eopl:error m "Invalid method"))))))

(define pop
  (lambda (stack)
    (stack 'pop)))

(define top
  (lambda (stack)
    (stack 'top)))

(define empty-stack?
  (lambda (stack)
    (stack 'empty-stack?)))