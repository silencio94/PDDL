(define (problem revercrossing-JH-prob1)
 (:domain Rivercrossing-JH)
 (:objects 
            from to - place
            boat0 - boat
            h0 h1 h2 - husband
            w0 w1 w2 - wife
            n0 n1 n2 n3 n4 n5 n6 - count)
            
 (:init 
        (num_0 n0) (num_1 n1) (num_2 n2) (num_3 n3)
        (next n0 n1) (next n1 n2) (next n2 n3) (next n3 n4) (next n4 n5) (next n5 n6)
        
        (above n0 n1) (above n0 n2) (above n0 n3) (above n0 n4) (above n0 n5) (above n0 n6)
        (above n1 n2) (above n1 n3) (above n1 n4) (above n1 n5) (above n1 n6)
        (above n2 n3) (above n2 n4) (above n2 n5) (above n2 n6)
        (above n3 n4) (above n3 n5) (above n3 n6) 
        (above n4 n5) (above n4 n6) 
        (above n5 n6) 
        
        (marry h0 w0)
        (marry h1 w1)
        (marry h2 w2)
        
        (at h0 from)
        (at h1 from)
        (at h2 from)
        (at w0 from)
        (at w1 from)
        (at w2 from)
        (at boat0 from)
        
        (total boat0 n0)
        (fulltotal boat0 n2)
        (emptytotal boat0 n0)
        
	
        (hcount from n3)
        (wcount from n3)
        (hcount to n0)
        (wcount to n0)
        )

(:goal (and 
            (at h0 to)
            (at h1 to)
            (at h2 to)
            (at w0 to)
            (at w1 to)
            (at w2 to)))
)
