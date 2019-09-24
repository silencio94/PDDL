(define (domain Rivercrossing-MC-V2)
 (:requirements :strips :typing)
 (:types place locatable count - object 
        boat countable - locatable
        missionary cannibal - countable)
    
 (:predicates 
                (in ?cnt_able - countable ?b - boat)
                (at ?loc_able - locatable ?p - place)
                (mcount ?p - place ?cnt - count)
                (ccount ?p - place ?cnt - count)
                (total ?b - boat ?cnt - count)
                (fulltotal ?b - boat ?full_totalcnt - count)
                (emptytotal ?b - boat ?empty_totalcnt - count)
                (solototal ?solo_totalcnt - count)
                (next ?cnt1 - count ?cnt2 - count)
                (above ?cnt1 - count ?cnt2 - count)
                (one_armed ?h - countable))

 (:action Embark_missionary
 :parameters 
                (?b - boat ?p - place ?m - missionary
                ?cur_pmcnt - count ?next_pmcnt - count
                ?cur_totalcnt - count ?next_totalcnt - count
                ?full_totalcnt - count)
 :precondition (and 
                    (at ?m ?p) (at ?b ?p)
                    (fulltotal ?b ?full_totalcnt) (not (total ?b ?full_totalcnt))
                    (total ?b ?cur_totalcnt)
                    (mcount ?p ?cur_pmcnt)
                    (next ?cur_totalcnt ?next_totalcnt)
                    (next ?next_pmcnt ?cur_pmcnt))
 :effect (and 
                (not (at ?m ?p))
                (not (total ?b ?cur_totalcnt))
                (not (mcount ?p ?cur_pmcnt))
                (in ?m ?b)
                (total ?b ?next_totalcnt) 
                (mcount ?p ?next_pmcnt)))
 
 (:action Embark_cannibal
 :parameters (?b - boat ?p - place ?c - cannibal
                ?cur_pccnt - count ?next_pccnt - count
                ?cur_totalcnt - count ?next_totalcnt - count
                ?full_totalcnt - count)
 :precondition (and 
                    (at ?c ?p) (at ?b ?p) 
                    (fulltotal ?b ?full_totalcnt) (not (total ?b ?full_totalcnt))
                    (total ?b ?cur_totalcnt)
                    (ccount ?p ?cur_pccnt)
                    (next ?cur_totalcnt ?next_totalcnt)
                    (next ?next_pccnt   ?cur_pccnt))
 :effect (and 
                (not (at ?c ?p)) 
                (not (total ?b ?cur_totalcnt))
                (not (ccount ?p ?cur_pccnt))
                (in ?c ?b) 
                (total ?b ?next_totalcnt)
                (ccount ?p ?next_pccnt)))
 
 (:action Disembark_missionary
 :parameters (?b - boat ?p - place ?m - missionary
                ?cur_pmcnt - count ?next_pmcnt - count
                ?cur_totalcnt - count ?next_totalcnt - count
                ?empty_totalcnt - count)
 :precondition (and 
                    (at ?b ?p)
                    (in ?m ?b)
                    (total ?b ?cur_totalcnt)
                    (mcount ?p ?cur_pmcnt)
                    (next ?next_totalcnt ?cur_totalcnt)
                    (next ?cur_pmcnt ?next_pmcnt))
 :effect (and 
                (at ?m ?p)
                (not (in ?m ?b))
		        (not (total ?b ?cur_totalcnt))
                (not (mcount ?p ?cur_pmcnt))
                (total ?b ?next_totalcnt)
                (mcount ?p ?next_pmcnt)))

 (:action Disembark_cannibal
 :parameters (?b - boat ?p - place ?c - cannibal
                ?cur_pccnt - count ?next_pccnt - count
                ?cur_totalcnt - count ?next_totalcnt - count
                ?empty_totalcnt - count)
 :precondition (and 
                    (at ?b ?p)
                    (in ?c ?b)
                    (total ?b ?cur_totalcnt)
                    (ccount ?p ?cur_pccnt)
                    (next ?next_totalcnt ?cur_totalcnt)
                    (next ?cur_pccnt ?next_pccnt))
 :effect (and 
                (at ?c ?p)
                (not (in ?c ?b))
                (not (total ?b ?cur_totalcnt))
                (not (ccount ?p ?cur_pccnt))
                (total ?b ?next_totalcnt)
                (ccount ?p ?next_pccnt)))
 
 (:action Cross_solo
 :parameters (?b - boat ?from ?to - place ?h - countable
                ?pccnt - count ?pmcnt - count
                ?solo_totalcnt - count
                ?empty_totalcnt - count)
 :precondition (and
                    (at ?b ?from) (not (at ?b ?to))
                    (mcount ?from ?pmcnt)
                    (ccount ?from ?pccnt)
                    (not (above ?pmcnt ?pccnt))
                    (emptytotal ?b ?empty_totalcnt) (not (total ?b ?empty_totalcnt))
                    (solototal ?solo_totalcnt) (total ?b ?solo_totalcnt)
                    (in ?h ?b)
                    (not (one_armed ?h)))
 :effect (and 
                (not (at ?b ?from))
                (at ?b ?to)))
 
 (:action Cross_together
 :parameters (?b - boat ?from ?to - place
                ?pccnt - count ?pmcnt - count
                ?solo_totalcnt - count
                ?empty_totalcnt - count)
 :precondition (and
                    (at ?b ?from)
                    (mcount ?from ?pmcnt)
                    (ccount ?from ?pccnt)
                    (not (above ?pmcnt ?pccnt))
                    (emptytotal ?b ?empty_totalcnt) (not (total ?b ?empty_totalcnt))
                    (solototal ?solo_totalcnt) (not (total ?b ?solo_totalcnt)))
 :effect (and 
                (not (at ?b ?from))
                (at ?b ?to)))
)
