;a
((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fi k)
      (cond ((= k 0) 0)
            ((= k 1) 1)
            (else (+ (fi fi (- k 1)) (fi fi (- k 2))))))))
 10)