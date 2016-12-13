;ex2.75.scm

(define (make-from-mag-ang r a)
  (define (dispach op)
    (cond ((eq? op 'real-part) (* r (cos a)))
          ((eq? op 'image-part) (* r (sin a)))
          ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          (else (error "Unknown op --MAKE-FROM-MAG-ANG" op))))
  dispach)