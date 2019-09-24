(define (problem revercrossing-prob1)
 (:domain Rivercrossing-MC-V1)
 (:objects 
            from to - place
            boat - boat
            m0 m1 m2 - missionary
            c0 c1 c2 - cannibal
            n0 n1 n2 n3 n4 n5 n6 - count)
            
 (:init 
        (next n0 n1) (next n1 n2) (next n2 n3) (next n3 n4) (next n4 n5) (next n5 n6)
        
        (above n0 n1) (above n0 n2) (above n0 n3) (above n0 n4) (above n0 n5) (above n0 n6)
        (above n1 n2) (above n1 n3) (above n1 n4) (above n1 n5) (above n1 n6)
        (above n2 n3) (above n2 n4) (above n2 n5) (above n2 n6)
        (above n3 n4) (above n3 n5) (above n3 n6) 
        (above n4 n5) (above n4 n6) 
        (above n5 n6) 
        
        (at m0 from)
        (at m1 from)
        (at m2 from)
        (at c0 from)
        (at c1 from)
        (at c2 from)
        (at boat from)
        
        (total boat n0)
        (fulltotal boat n2)
        (emptytotal boat n0)
        
        (mcount from n3)
        (ccount from n3)
        (mcount to n0)
        (ccount to n0)
        )

(:goal (and 
            (at m0 to)
            (at m1 to)
            (at m2 to)
            (at c0 to)
            (at c1 to)
            (at c2 to)))
)
