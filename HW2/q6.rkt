#lang eopl

(define number->bintree (lambda (n) (list n '() '())))
(define current-element car)
(define move-to-left-son cadr)
(define move-to-right-son caddr)

(define insert-to-left
  (lambda (n t)
    (list (current-element t)
          (list n (move-to-left-son t) '())
          (move-to-right-son t))))

(define insert-to-right
  (lambda (n t)
    (list (current-element t)
          (move-to-left-son t)
          (list n '() (move-to-right-son t)))))

(define at-leaf? null?)
