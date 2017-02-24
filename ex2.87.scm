;ex2.87.scm
(define (zero-poly? poly) 
   (define (zero-terms? termlist) 
     (or (empty-termlist? termlist) 
         (and (=zero? (coeff (first-term termlist))) 
              (zero-terms? (rest-terms termlist))))) 
   (zero-terms? (term-list poly))) 