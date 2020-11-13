#lang racket
(define (sum-of-list l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sum-of-list (rest l)))]))

(define (get-first-col matrix)
  (cond
    [(= (length matrix) 1) (list (list (car (car matrix))))]
    [else (list (map car matrix))]
   ))

(define (get-rest-cols matrix)
  (cond
    [(= (length matrix) 1) (list (cdr (car matrix)))]
    [else (map cdr matrix)]
   ))

(define (get-rest-rows matrix)
  (cond
    [(= (length matrix) 1) (list empty)]
    [else (cdr matrix)]
   ))

(define (inner-dot row col)
  (
   cond
    [(and (= (length row) 1) (= (length col) 1)) (list (sum-of-list (map * (car row) (car col))))]
   ))

(define (main matrix1 matrix2)
    (cond
    [(or (empty? matrix1) (empty? matrix2) (empty? (car matrix1)) (empty? (car matrix2)) (empty? (car (car matrix1))) (empty? (car (car matrix2)))) empty]
    [else (append (append (list (append (inner-dot (list (car matrix1)) (get-first-col matrix2)) (flatten (main (list (car matrix1)) (get-rest-cols matrix2))))))  (main (get-rest-rows matrix1) matrix2))]
   ))

;(map car '((-1) (1)))
;(map * '(1 2) '(3 4))
;(main '((2 1) (4 3)) '((-1) (1)))
;(main '((1 2 3) (4 5 6)) '((1 2) (3 4) (5 6)))
;(main '((1)) '((2)))
;(main '((2 20)) '((1 2 3 4 5 6 7 8 9 10) (1 2 3 4 5 6 7 8 9 10)))
;(main '((2)) '((1 2 3 4 5 6 7 8 9 10)))
;(main '((1 2 3) (4 5 6) (7 8 9)) '((10 11 12 13) (14 15 16 17) (18 19 20 21)))