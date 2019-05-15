(set-logic QF_LRA)
(set-info :notes | Strip-packing problem.|)
(declare-fun x0 () Real)
(declare-fun y0 () Real)
(declare-fun x1 () Real)
(declare-fun y1 () Real)
(declare-fun x2 () Real)
(declare-fun y2 () Real)
(declare-fun x3 () Real)
(declare-fun y3 () Real)
(declare-fun x4 () Real)
(declare-fun y4 () Real)
(declare-fun x5 () Real)
(declare-fun y5 () Real)
(declare-fun x6 () Real)
(declare-fun y6 () Real)
(declare-fun x7 () Real)
(declare-fun y7 () Real)
(declare-fun x8 () Real)
(declare-fun y8 () Real)
(declare-fun z () Real)
(declare-fun c () Real)
(assert (and (= c z) (and (>= x0 0) 
(and (>= y0 0) 
(and (>= x1 0) 
(and (>= y1 0) 
(and (>= x2 0) 
(and (>= y2 0) 
(and (>= x3 0) 
(and (>= y3 0) 
(and (>= x4 0) 
(and (>= y4 0) 
(and (>= x5 0) 
(and (>= y5 0) 
(and (>= x6 0) 
(and (>= y6 0) 
(and (>= x7 0) 
(and (>= y7 0) 
(and (>= x8 0) 
(and (>= y8 0) 
(and (>= z 0) 
(and (>= c 0) 
(and (<= (+ x0 0.0008714608) z) 
(and (<= 0.7906023681 y0) 
(and (<= y0 1.5) 
(and (<= x0 (- 2.8061292631 0.0008714608)) 
(and (>= x0 0) 
(and (<= (+ x1 0.9104343766) z) 
(and (<= 0.7658170405 y1) 
(and (<= y1 1.5) 
(and (<= x1 (- 2.8061292631 0.9104343766)) 
(and (>= x1 0) 
(and (<= (+ x2 0.9148147319) z) 
(and (<= 0.7525590151 y2) 
(and (<= y2 1.5) 
(and (<= x2 (- 2.8061292631 0.9148147319)) 
(and (>= x2 0) 
(and (<= (+ x3 0.9800086938) z) 
(and (<= 0.733232539 y3) 
(and (<= y3 1.5) 
(and (<= x3 (- 2.8061292631 0.9800086938)) 
(and (>= x3 0) 
(and (<= (+ x4 0.3581315649) z) 
(and (<= 0.5408662372 y4) 
(and (<= y4 1.5) 
(and (<= x4 (- 2.8061292631 0.3581315649)) 
(and (>= x4 0) 
(and (<= (+ x5 0.5468675689) z) 
(and (<= 0.5050173061 y5) 
(and (<= y5 1.5) 
(and (<= x5 (- 2.8061292631 0.5468675689)) 
(and (>= x5 0) 
(and (<= (+ x6 0.8736691013) z) 
(and (<= 0.2951830771 y6) 
(and (<= y6 1.5) 
(and (<= x6 (- 2.8061292631 0.8736691013)) 
(and (>= x6 0) 
(and (<= (+ x7 0.8077691578) z) 
(and (<= 0.1694787264 y7) 
(and (<= y7 1.5) 
(and (<= x7 (- 2.8061292631 0.8077691578)) 
(and (>= x7 0) 
(and (<= (+ x8 0.7732941406) z) 
(and (<= 0.0377049642 y8) 
(and (<= y8 1.5) 
(and (<= x8 (- 2.8061292631 0.7732941406)) 
(and (>= x8 0) 
(and (<= c 2.8061292631) 
(and (or (<= (+ x0 0.0008714608) x1) (or (<= (+ x1 0.9104343766) x0) (or (>= (- y0 0.7906023681) y1) (or (>= (- y1 0.7658170405) y0))))) 
(and (or (<= (+ x0 0.0008714608) x2) (or (<= (+ x2 0.9148147319) x0) (or (>= (- y0 0.7906023681) y2) (or (>= (- y2 0.7525590151) y0))))) 
(and (or (<= (+ x0 0.0008714608) x3) (or (<= (+ x3 0.9800086938) x0) (or (>= (- y0 0.7906023681) y3) (or (>= (- y3 0.733232539) y0))))) 
(and (or (<= (+ x0 0.0008714608) x4) (or (<= (+ x4 0.3581315649) x0) (or (>= (- y0 0.7906023681) y4) (or (>= (- y4 0.5408662372) y0))))) 
(and (or (<= (+ x0 0.0008714608) x5) (or (<= (+ x5 0.5468675689) x0) (or (>= (- y0 0.7906023681) y5) (or (>= (- y5 0.5050173061) y0))))) 
(and (or (<= (+ x0 0.0008714608) x6) (or (<= (+ x6 0.8736691013) x0) (or (>= (- y0 0.7906023681) y6) (or (>= (- y6 0.2951830771) y0))))) 
(and (or (<= (+ x0 0.0008714608) x7) (or (<= (+ x7 0.8077691578) x0) (or (>= (- y0 0.7906023681) y7) (or (>= (- y7 0.1694787264) y0))))) 
(and (or (<= (+ x0 0.0008714608) x8) (or (<= (+ x8 0.7732941406) x0) (or (>= (- y0 0.7906023681) y8) (or (>= (- y8 0.0377049642) y0))))) 
(and (or (<= (+ x1 0.9104343766) x2) (or (<= (+ x2 0.9148147319) x1) (or (>= (- y1 0.7658170405) y2) (or (>= (- y2 0.7525590151) y1))))) 
(and (or (<= (+ x1 0.9104343766) x3) (or (<= (+ x3 0.9800086938) x1) (or (>= (- y1 0.7658170405) y3) (or (>= (- y3 0.733232539) y1))))) 
(and (or (<= (+ x1 0.9104343766) x4) (or (<= (+ x4 0.3581315649) x1) (or (>= (- y1 0.7658170405) y4) (or (>= (- y4 0.5408662372) y1))))) 
(and (or (<= (+ x1 0.9104343766) x5) (or (<= (+ x5 0.5468675689) x1) (or (>= (- y1 0.7658170405) y5) (or (>= (- y5 0.5050173061) y1))))) 
(and (or (<= (+ x1 0.9104343766) x6) (or (<= (+ x6 0.8736691013) x1) (or (>= (- y1 0.7658170405) y6) (or (>= (- y6 0.2951830771) y1))))) 
(and (or (<= (+ x1 0.9104343766) x7) (or (<= (+ x7 0.8077691578) x1) (or (>= (- y1 0.7658170405) y7) (or (>= (- y7 0.1694787264) y1))))) 
(and (or (<= (+ x1 0.9104343766) x8) (or (<= (+ x8 0.7732941406) x1) (or (>= (- y1 0.7658170405) y8) (or (>= (- y8 0.0377049642) y1))))) 
(and (or (<= (+ x2 0.9148147319) x3) (or (<= (+ x3 0.9800086938) x2) (or (>= (- y2 0.7525590151) y3) (or (>= (- y3 0.733232539) y2))))) 
(and (or (<= (+ x2 0.9148147319) x4) (or (<= (+ x4 0.3581315649) x2) (or (>= (- y2 0.7525590151) y4) (or (>= (- y4 0.5408662372) y2))))) 
(and (or (<= (+ x2 0.9148147319) x5) (or (<= (+ x5 0.5468675689) x2) (or (>= (- y2 0.7525590151) y5) (or (>= (- y5 0.5050173061) y2))))) 
(and (or (<= (+ x2 0.9148147319) x6) (or (<= (+ x6 0.8736691013) x2) (or (>= (- y2 0.7525590151) y6) (or (>= (- y6 0.2951830771) y2))))) 
(and (or (<= (+ x2 0.9148147319) x7) (or (<= (+ x7 0.8077691578) x2) (or (>= (- y2 0.7525590151) y7) (or (>= (- y7 0.1694787264) y2))))) 
(and (or (<= (+ x2 0.9148147319) x8) (or (<= (+ x8 0.7732941406) x2) (or (>= (- y2 0.7525590151) y8) (or (>= (- y8 0.0377049642) y2))))) 
(and (or (<= (+ x3 0.9800086938) x4) (or (<= (+ x4 0.3581315649) x3) (or (>= (- y3 0.733232539) y4) (or (>= (- y4 0.5408662372) y3))))) 
(and (or (<= (+ x3 0.9800086938) x5) (or (<= (+ x5 0.5468675689) x3) (or (>= (- y3 0.733232539) y5) (or (>= (- y5 0.5050173061) y3))))) 
(and (or (<= (+ x3 0.9800086938) x6) (or (<= (+ x6 0.8736691013) x3) (or (>= (- y3 0.733232539) y6) (or (>= (- y6 0.2951830771) y3))))) 
(and (or (<= (+ x3 0.9800086938) x7) (or (<= (+ x7 0.8077691578) x3) (or (>= (- y3 0.733232539) y7) (or (>= (- y7 0.1694787264) y3))))) 
(and (or (<= (+ x3 0.9800086938) x8) (or (<= (+ x8 0.7732941406) x3) (or (>= (- y3 0.733232539) y8) (or (>= (- y8 0.0377049642) y3))))) 
(and (or (<= (+ x4 0.3581315649) x5) (or (<= (+ x5 0.5468675689) x4) (or (>= (- y4 0.5408662372) y5) (or (>= (- y5 0.5050173061) y4))))) 
(and (or (<= (+ x4 0.3581315649) x6) (or (<= (+ x6 0.8736691013) x4) (or (>= (- y4 0.5408662372) y6) (or (>= (- y6 0.2951830771) y4))))) 
(and (or (<= (+ x4 0.3581315649) x7) (or (<= (+ x7 0.8077691578) x4) (or (>= (- y4 0.5408662372) y7) (or (>= (- y7 0.1694787264) y4))))) 
(and (or (<= (+ x4 0.3581315649) x8) (or (<= (+ x8 0.7732941406) x4) (or (>= (- y4 0.5408662372) y8) (or (>= (- y8 0.0377049642) y4))))) 
(and (or (<= (+ x5 0.5468675689) x6) (or (<= (+ x6 0.8736691013) x5) (or (>= (- y5 0.5050173061) y6) (or (>= (- y6 0.2951830771) y5))))) 
(and (or (<= (+ x5 0.5468675689) x7) (or (<= (+ x7 0.8077691578) x5) (or (>= (- y5 0.5050173061) y7) (or (>= (- y7 0.1694787264) y5))))) 
(and (or (<= (+ x5 0.5468675689) x8) (or (<= (+ x8 0.7732941406) x5) (or (>= (- y5 0.5050173061) y8) (or (>= (- y8 0.0377049642) y5))))) 
(and (or (<= (+ x6 0.8736691013) x7) (or (<= (+ x7 0.8077691578) x6) (or (>= (- y6 0.2951830771) y7) (or (>= (- y7 0.1694787264) y6))))) 
(and (or (<= (+ x6 0.8736691013) x8) (or (<= (+ x8 0.7732941406) x6) (or (>= (- y6 0.2951830771) y8) (or (>= (- y8 0.0377049642) y6))))) 
(and (or (<= (+ x7 0.8077691578) x8) (or (<= (+ x8 0.7732941406) x7) (or (>= (- y7 0.1694787264) y8) (or (>= (- y8 0.0377049642) y7))))) ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)