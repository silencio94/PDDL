(define (domain Rivercrossing-JH)
 (:requirements :strips :typing)
 (:types place locatable count - object
        boat countable - locatable
        husband wife - countable)
    
 (:predicates (in ?cnt_able - countable ?b - boat)
                (at ?loc_able - locatable ?p - place)
                (marry ?h - husband ?w - wife)
                (hcount ?p - place ?cnt - count)
                (wcount ?p - place ?cnt - count)
                (total ?b - boat ?cnt - count)
                (fulltotal ?b - boat ?full_totalcnt - count)
                (emptytotal ?b - boat ?empty_totalcnt - count)
                (next ?cnt1 - count ?cnt2 - count)
                (above ?cnt1 - count ?cnt2 - count)
                (num_0 ?cnt1 - count)
                (num_1 ?cnt1 - count)
                (num_2 ?cnt1 - count)
                (num_3 ?cnt1 - count)
                )
                
 (:action Embark_husband
 :parameters 
                (?b - boat ?p - place ?h - husband
                ?curr_hcnt - count ?next_hcnt - count
                ?curr_totalcnt - count ?next_totalcnt - count
                ?full_totalcnt - count)
 :precondition (and 
                    (at ?h ?p) (at ?b ?p) ; husband and boat - same location ;
                    (fulltotal ?b ?full_totalcnt) (not (total ?b ?full_totalcnt)) ; boat - not full ;
                    (total ?b ?curr_totalcnt)
                    (hcount ?p ?curr_hcnt)
                    (next ?curr_totalcnt ?next_totalcnt) ; for increasing total
                    (next ?next_hcnt ?curr_hcnt))        ; for decreasing husband num
 :effect (and 
                (not (at ?h ?p))
                (not (total  ?b ?curr_totalcnt))
                (not (hcount ?p ?curr_hcnt))
                (in ?h ?b)
                (total  ?b ?next_totalcnt) 
                (hcount ?p ?next_hcnt)))
 
 (:action Embark_wife
 :parameters 
                (?b - boat ?p - place ?w - wife
                ?curr_wcnt - count ?next_wcnt - count
                ?curr_totalcnt - count ?next_totalcnt - count
                ?full_totalcnt - count)
 :precondition (and 
                    (at ?w ?p) (at ?b ?p) 
                    (fulltotal ?b ?full_totalcnt) (not (total ?b ?full_totalcnt))
                    (total ?b ?curr_totalcnt)
                    (wcount ?p ?curr_wcnt)
                    (next ?curr_totalcnt ?next_totalcnt)
                    (next ?next_wcnt ?curr_wcnt))
 :effect (and 
                (not (at ?w ?p))
                (not (total  ?b ?curr_totalcnt))
                (not (wcount ?p ?curr_wcnt))
                (in ?w ?b)
                (total  ?b ?next_totalcnt) 
                (wcount ?p ?next_wcnt)))
 
 (:action Disembark_husband
 :parameters (?b - boat ?p - place ?h - husband
                ?curr_hcnt - count ?next_hcnt - count
                ?curr_totalcnt - count ?next_totalcnt - count)
 :precondition (and 
                    (at ?b ?p) (in ?h ?b)
                    (total ?b ?curr_totalcnt)
                    (hcount ?p ?curr_hcnt)
                    (next ?next_totalcnt ?curr_totalcnt) ; for decreasing total ;
                    (next ?curr_hcnt ?next_hcnt))        ; for incresing husband num ;
 :effect (and 
                (at ?h ?p)
                (not (in ?h ?b))
		        (not (total ?b ?curr_totalcnt))
                (not (hcount ?p ?curr_hcnt))
                (total ?b ?next_totalcnt)
                (hcount ?p ?next_hcnt)))

 (:action Disembark_wife
 :parameters (?b - boat ?p - place ?w - wife
                ?curr_wcnt - count ?next_wcnt - count
                ?curr_totalcnt - count ?next_totalcnt - count)
 :precondition (and 
                    (at ?b ?p) (in ?w ?b)
                    (total ?b ?curr_totalcnt)
                    (wcount ?p ?curr_wcnt)
                    (next ?next_totalcnt ?curr_totalcnt)
                    (next ?curr_wcnt ?next_wcnt))
 :effect (and 
                (at ?w ?p)
                (not (in ?w ?b))
		        (not (total ?b ?curr_totalcnt))
                (not (wcount ?p ?curr_wcnt))
                (total ?b ?next_totalcnt)
                (wcount ?p ?next_wcnt)))
 
 (:action Cross_by_0husband
 :parameters 
                (?b - boat ?from ?to - place 
                ?hcnt - count
                ?empty_totalcnt - count)
 :precondition (and
                    (at ?b ?from) (not (at ?b ?to))
                    (hcount ?from ?hcnt) (num_0 ?hcnt)
                    (emptytotal ?b ?empty_totalcnt) (not (total ?b ?empty_totalcnt)))
 :effect (and 
                (not (at ?b ?from))
                (at ?b ?to)))
 
 (:action Cross_by_0wife
 :parameters 
                (?b - boat ?from ?to - place 
                ?wcnt - count
                ?empty_totalcnt - count)
 :precondition (and
                    (at ?b ?from) (not (at ?b ?to))
                    (wcount ?from ?wcnt) (num_0 ?wcnt)
                    (emptytotal ?b ?empty_totalcnt) (not (total ?b ?empty_totalcnt)))
 :effect (and 
                (not (at ?b ?from))
                (at ?b ?to)))
 
 (:action Cross_by_1coupling
 :parameters 
            (?b - boat ?from ?to - place
            ?w0 - wife ?h0 - husband
            ?wcnt - count
            ?empty_totalcnt - count)
 :precondition (and
                    (at ?b ?from) (not (at ?b ?to)) ; regardless? ;
                    (wcount ?from ?wcnt) (num_1 ?wcnt)
                    (at ?w0 ?from) (marry ?h0 ?w0) (at ?h0 ?from) ; one couple ;
                    (emptytotal ?b ?empty_totalcnt) (not (total ?b ?empty_totalcnt)))
 :effect (and 
                (not (at ?b ?from))
                (at ?b ?to)))
 
 (:action Cross_by_2coupling
 :parameters 
            (?b - boat ?from ?to - place
            ?w0 ?w1 - wife ?h0 ?h1 - husband
            ?wcnt - count
            ?empty_totalcnt - count)
 :precondition (and
                    (at ?b ?from) (not (at ?b ?to)) ; regardless? ;
                    (wcount ?from ?wcnt) (num_2 ?wcnt)
                    (at ?w0 ?from) (marry ?h0 ?w0) (at ?h0 ?from) ; one couple ;
                    (not (marry ?h1 ?w0)) 
                    (at ?h1 ?from) (marry ?h1 ?w1) (at ?w1 ?from) ; two couple ;
                    (emptytotal ?b ?empty_totalcnt) (not (total ?b ?empty_totalcnt)))
 :effect (and 
                (not (at ?b ?from))
                (at ?b ?to)))

)
