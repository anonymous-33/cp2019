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
(and (<= (+ x0 0.9678186101) z) 
(and (<= 0.9310563297 y0) 
(and (<= y0 1.0) 
(and (<= x0 (- 2.6877775832 0.9678186101)) 
(and (>= x0 0) 
(and (<= (+ x1 0.1568504123) z) 
(and (<= 0.8646088202 y1) 
(and (<= y1 1.0) 
(and (<= x1 (- 2.6877775832 0.1568504123)) 
(and (>= x1 0) 
(and (<= (+ x2 0.1117319235) z) 
(and (<= 0.600005604 y2) 
(and (<= y2 1.0) 
(and (<= x2 (- 2.6877775832 0.1117319235)) 
(and (>= x2 0) 
(and (<= (+ x3 0.7714607966) z) 
(and (<= 0.484282716 y3) 
(and (<= y3 1.0) 
(and (<= x3 (- 2.6877775832 0.7714607966)) 
(and (>= x3 0) 
(and (<= (+ x4 0.08045998) z) 
(and (<= 0.4722306555 y4) 
(and (<= y4 1.0) 
(and (<= x4 (- 2.6877775832 0.08045998)) 
(and (>= x4 0) 
(and (<= (+ x5 0.6799158407) z) 
(and (<= 0.1749079819 y5) 
(and (<= y5 1.0) 
(and (<= x5 (- 2.6877775832 0.6799158407)) 
(and (>= x5 0) 
(and (<= (+ x6 0.4113798172) z) 
(and (<= 0.1402133265 y6) 
(and (<= y6 1.0) 
(and (<= x6 (- 2.6877775832 0.4113798172)) 
(and (>= x6 0) 
(and (<= (+ x7 0.0321034065) z) 
(and (<= 0.0654806736 y7) 
(and (<= y7 1.0) 
(and (<= x7 (- 2.6877775832 0.0321034065)) 
(and (>= x7 0) 
(and (<= (+ x8 0.4162695144) z) 
(and (<= 0.052800478 y8) 
(and (<= y8 1.0) 
(and (<= x8 (- 2.6877775832 0.4162695144)) 
(and (>= x8 0) 
(and (<= c 2.6877775832) 
(and (or (<= (+ x0 0.9678186101) x1) (or (<= (+ x1 0.1568504123) x0) (or (>= (- y0 0.9310563297) y1) (or (>= (- y1 0.8646088202) y0))))) 
(and (or (<= (+ x0 0.9678186101) x2) (or (<= (+ x2 0.1117319235) x0) (or (>= (- y0 0.9310563297) y2) (or (>= (- y2 0.600005604) y0))))) 
(and (or (<= (+ x0 0.9678186101) x3) (or (<= (+ x3 0.7714607966) x0) (or (>= (- y0 0.9310563297) y3) (or (>= (- y3 0.484282716) y0))))) 
(and (or (<= (+ x0 0.9678186101) x4) (or (<= (+ x4 0.08045998) x0) (or (>= (- y0 0.9310563297) y4) (or (>= (- y4 0.4722306555) y0))))) 
(and (or (<= (+ x0 0.9678186101) x5) (or (<= (+ x5 0.6799158407) x0) (or (>= (- y0 0.9310563297) y5) (or (>= (- y5 0.1749079819) y0))))) 
(and (or (<= (+ x0 0.9678186101) x6) (or (<= (+ x6 0.4113798172) x0) (or (>= (- y0 0.9310563297) y6) (or (>= (- y6 0.1402133265) y0))))) 
(and (or (<= (+ x0 0.9678186101) x7) (or (<= (+ x7 0.0321034065) x0) (or (>= (- y0 0.9310563297) y7) (or (>= (- y7 0.0654806736) y0))))) 
(and (or (<= (+ x0 0.9678186101) x8) (or (<= (+ x8 0.4162695144) x0) (or (>= (- y0 0.9310563297) y8) (or (>= (- y8 0.052800478) y0))))) 
(and (or (<= (+ x1 0.1568504123) x2) (or (<= (+ x2 0.1117319235) x1) (or (>= (- y1 0.8646088202) y2) (or (>= (- y2 0.600005604) y1))))) 
(and (or (<= (+ x1 0.1568504123) x3) (or (<= (+ x3 0.7714607966) x1) (or (>= (- y1 0.8646088202) y3) (or (>= (- y3 0.484282716) y1))))) 
(and (or (<= (+ x1 0.1568504123) x4) (or (<= (+ x4 0.08045998) x1) (or (>= (- y1 0.8646088202) y4) (or (>= (- y4 0.4722306555) y1))))) 
(and (or (<= (+ x1 0.1568504123) x5) (or (<= (+ x5 0.6799158407) x1) (or (>= (- y1 0.8646088202) y5) (or (>= (- y5 0.1749079819) y1))))) 
(and (or (<= (+ x1 0.1568504123) x6) (or (<= (+ x6 0.4113798172) x1) (or (>= (- y1 0.8646088202) y6) (or (>= (- y6 0.1402133265) y1))))) 
(and (or (<= (+ x1 0.1568504123) x7) (or (<= (+ x7 0.0321034065) x1) (or (>= (- y1 0.8646088202) y7) (or (>= (- y7 0.0654806736) y1))))) 
(and (or (<= (+ x1 0.1568504123) x8) (or (<= (+ x8 0.4162695144) x1) (or (>= (- y1 0.8646088202) y8) (or (>= (- y8 0.052800478) y1))))) 
(and (or (<= (+ x2 0.1117319235) x3) (or (<= (+ x3 0.7714607966) x2) (or (>= (- y2 0.600005604) y3) (or (>= (- y3 0.484282716) y2))))) 
(and (or (<= (+ x2 0.1117319235) x4) (or (<= (+ x4 0.08045998) x2) (or (>= (- y2 0.600005604) y4) (or (>= (- y4 0.4722306555) y2))))) 
(and (or (<= (+ x2 0.1117319235) x5) (or (<= (+ x5 0.6799158407) x2) (or (>= (- y2 0.600005604) y5) (or (>= (- y5 0.1749079819) y2))))) 
(and (or (<= (+ x2 0.1117319235) x6) (or (<= (+ x6 0.4113798172) x2) (or (>= (- y2 0.600005604) y6) (or (>= (- y6 0.1402133265) y2))))) 
(and (or (<= (+ x2 0.1117319235) x7) (or (<= (+ x7 0.0321034065) x2) (or (>= (- y2 0.600005604) y7) (or (>= (- y7 0.0654806736) y2))))) 
(and (or (<= (+ x2 0.1117319235) x8) (or (<= (+ x8 0.4162695144) x2) (or (>= (- y2 0.600005604) y8) (or (>= (- y8 0.052800478) y2))))) 
(and (or (<= (+ x3 0.7714607966) x4) (or (<= (+ x4 0.08045998) x3) (or (>= (- y3 0.484282716) y4) (or (>= (- y4 0.4722306555) y3))))) 
(and (or (<= (+ x3 0.7714607966) x5) (or (<= (+ x5 0.6799158407) x3) (or (>= (- y3 0.484282716) y5) (or (>= (- y5 0.1749079819) y3))))) 
(and (or (<= (+ x3 0.7714607966) x6) (or (<= (+ x6 0.4113798172) x3) (or (>= (- y3 0.484282716) y6) (or (>= (- y6 0.1402133265) y3))))) 
(and (or (<= (+ x3 0.7714607966) x7) (or (<= (+ x7 0.0321034065) x3) (or (>= (- y3 0.484282716) y7) (or (>= (- y7 0.0654806736) y3))))) 
(and (or (<= (+ x3 0.7714607966) x8) (or (<= (+ x8 0.4162695144) x3) (or (>= (- y3 0.484282716) y8) (or (>= (- y8 0.052800478) y3))))) 
(and (or (<= (+ x4 0.08045998) x5) (or (<= (+ x5 0.6799158407) x4) (or (>= (- y4 0.4722306555) y5) (or (>= (- y5 0.1749079819) y4))))) 
(and (or (<= (+ x4 0.08045998) x6) (or (<= (+ x6 0.4113798172) x4) (or (>= (- y4 0.4722306555) y6) (or (>= (- y6 0.1402133265) y4))))) 
(and (or (<= (+ x4 0.08045998) x7) (or (<= (+ x7 0.0321034065) x4) (or (>= (- y4 0.4722306555) y7) (or (>= (- y7 0.0654806736) y4))))) 
(and (or (<= (+ x4 0.08045998) x8) (or (<= (+ x8 0.4162695144) x4) (or (>= (- y4 0.4722306555) y8) (or (>= (- y8 0.052800478) y4))))) 
(and (or (<= (+ x5 0.6799158407) x6) (or (<= (+ x6 0.4113798172) x5) (or (>= (- y5 0.1749079819) y6) (or (>= (- y6 0.1402133265) y5))))) 
(and (or (<= (+ x5 0.6799158407) x7) (or (<= (+ x7 0.0321034065) x5) (or (>= (- y5 0.1749079819) y7) (or (>= (- y7 0.0654806736) y5))))) 
(and (or (<= (+ x5 0.6799158407) x8) (or (<= (+ x8 0.4162695144) x5) (or (>= (- y5 0.1749079819) y8) (or (>= (- y8 0.052800478) y5))))) 
(and (or (<= (+ x6 0.4113798172) x7) (or (<= (+ x7 0.0321034065) x6) (or (>= (- y6 0.1402133265) y7) (or (>= (- y7 0.0654806736) y6))))) 
(and (or (<= (+ x6 0.4113798172) x8) (or (<= (+ x8 0.4162695144) x6) (or (>= (- y6 0.1402133265) y8) (or (>= (- y8 0.052800478) y6))))) 
(and (or (<= (+ x7 0.0321034065) x8) (or (<= (+ x8 0.4162695144) x7) (or (>= (- y7 0.0654806736) y8) (or (>= (- y8 0.052800478) y7))))) ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)