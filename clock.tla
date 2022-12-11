---- MODULE clock ----
EXTENDS TLC, Naturals, Sequences, FiniteSets

VARIABLES
    min,
    hr

ClockTypeOK ==
    /\ min \in 0..59
    /\ hr \in 1..12

-----------------------

Init ==
    /\ min = 0
    /\ hr = 12

Next ==
    \/  /\ min # 59
        /\ min' = min + 1
        /\ hr' = hr
    \/  /\ min = 59
        /\ min' = 0
        /\ hr' = IF hr # 12 THEN hr + 1 ELSE 1

ClockSpec == Init /\ [][Next]_<<min, hr>>

====