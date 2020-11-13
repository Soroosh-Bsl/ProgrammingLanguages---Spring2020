#lang racket

(define-namespace-anchor anc)
(define (main input-file-path output-file-path)
  (define input-file (open-input-file input-file-path))
  (define output-file (open-output-file output-file-path #:exists `replace))
  (core-reader-writer input-file output-file)
  (close-input-port input-file)
  (close-output-port output-file)
  )

(define (core-reader-writer ifile ofile)
  (define line (read-more ifile))
  (cond
    [(eof-object? line)]
    [else (eval-write line ofile) (core-reader-writer ifile ofile)]
   )
  )

(define (read-more ifile)
  (define ns (namespace-anchor->namespace anc))
  (read ifile)
  )

(define (eval-write line ofile)
  (define ns (namespace-anchor->namespace anc))
  (println (eval line ns) ofile)
  )


;(main "D:\\University\\Courses\\Semester 8\\Programming Languages\\HWs\\HW1\\input.txt" "D:\\University\\Courses\\Semester 8\\Programming Languages\\HWs\\HW1\\output.txt")