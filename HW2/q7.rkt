#lang eopl

;REPEAT OF Q6 Functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define bintree-with-memory cons)
(define bintree-with-memory->tree car)
(define bintree-with-memory->memory cdr)
(define root-memory '())
(define root-memory? null?)
(define push-memory-item cons)
(define memory->top car)
(define memory->parent cdr)

(define memory-item (lambda (d n t) (list d n t)))
(define memory-item->direction car)
(define memory-item->head-value cadr)
(define memory-item->other-direction-tree caddr)

(define left-memory (lambda (n t) (memory-item 'left n t)))
(define right-memory (lambda (n t) (memory-item 'right n t)))
(define left-memory? (lambda (e) (eqv? (memory-item->direction e) 'left)))

(define number->bintree-with-memory
  (lambda (n)
    (bintree-with-memory (number->bintree n) root-memory)))

(define current-element-bintree-with-memory
  (lambda (l)
    (current-element (bintree-with-memory->tree l))))

(define move-up-bintree-with-memory
  (lambda (l)
    (let ((memory (bintree-with-memory->memory l)))
      (if (root-memory? memory)
          (eopl:error 'move-up "At ROOT!: ~s" l)
          (let ((top (memory->top memory)))
            (bintree-with-memory (if (left-memory? top)
                          (list (memory-item->head-value top)
                                 (bintree-with-memory->tree l)
                                 (memory-item->other-direction-tree top))
                          (list (memory-item->head-value top)
                                 (memory-item->other-direction-tree top)
                                 (bintree-with-memory->tree l)))
                      (memory->parent memory)))))))

(define move-to-left-bintree-with-memory
  (lambda (l)
    (let ((t (bintree-with-memory->tree l)))
      (bintree-with-memory (move-to-left-son t)
                (push-memory-item (left-memory (current-element t)
                                            (move-to-right-son t))
                                      (bintree-with-memory->memory l))))))

(define move-to-right-bintree-with-memory
  (lambda (l)
    (let ((t (bintree-with-memory->tree l)))
      (bintree-with-memory (move-to-right-son t)
                (push-memory-item (right-memory (current-element t)
                                             (move-to-left-son t))
                                      (bintree-with-memory->memory l))))))

(define at-root?-bintree-with-memory
  (lambda (l)
    (root-memory? (bintree-with-memory->memory l))))

(define at-leaf?-bintree-with-memory
  (lambda (l)
    (at-leaf? (bintree-with-memory->tree l))))

(define insert-to-left-bintree-with-memory
  (lambda (n l)
    (bintree-with-memory (insert-to-left n (bintree-with-memory->tree l))
              (bintree-with-memory->memory l))))

(define insert-to-right-bintree-with-memory
  (lambda (n l)
    (bintree-with-memory (insert-to-right n (bintree-with-memory->tree l))
              (bintree-with-memory->memory l))))


;TEST
;(display (move-up-bintree-with-memory (move-to-right-bintree-with-memory (insert-to-right-bintree-with-memory 14 (insert-to-left-bintree-with-memory 12 (number->bintree-with-memory 13))))))
