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
(declare-fun x9 () Real)
(declare-fun y9 () Real)
(declare-fun x10 () Real)
(declare-fun y10 () Real)
(declare-fun x11 () Real)
(declare-fun y11 () Real)
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
(and (>= x9 0) 
(and (>= y9 0) 
(and (>= x10 0) 
(and (>= y10 0) 
(and (>= x11 0) 
(and (>= y11 0) 
(and (>= z 0) 
(and (>= c 0) 
(and (<= (+ x0 0.3235560465) z) 
(and (<= 0.9147586828 y0) 
(and (<= y0 1.0) 
(and (<= x0 (- 2.7947782041 0.3235560465)) 
(and (>= x0 0) 
(and (<= (+ x1 0.3625888386) z) 
(and (<= 0.7575202458 y1) 
(and (<= y1 1.0) 
(and (<= x1 (- 2.7947782041 0.3625888386)) 
(and (>= x1 0) 
(and (<= (+ x2 0.5024634312) z) 
(and (<= 0.7338262769 y2) 
(and (<= y2 1.0) 
(and (<= x2 (- 2.7947782041 0.5024634312)) 
(and (>= x2 0) 
(and (<= (+ x3 0.914811935) z) 
(and (<= 0.6826210825 y3) 
(and (<= y3 1.0) 
(and (<= x3 (- 2.7947782041 0.914811935)) 
(and (>= x3 0) 
(and (<= (+ x4 0.0202771474) z) 
(and (<= 0.6806613563 y4) 
(and (<= y4 1.0) 
(and (<= x4 (- 2.7947782041 0.0202771474)) 
(and (>= x4 0) 
(and (<= (+ x5 0.6710808054) z) 
(and (<= 0.3962154769 y5) 
(and (<= y5 1.0) 
(and (<= x5 (- 2.7947782041 0.6710808054)) 
(and (>= x5 0) 
(and (<= (+ x6 0.3925057916) z) 
(and (<= 0.3650112443 y6) 
(and (<= y6 1.0) 
(and (<= x6 (- 2.7947782041 0.3925057916)) 
(and (>= x6 0) 
(and (<= (+ x7 0.3068522393) z) 
(and (<= 0.1750962858 y7) 
(and (<= y7 1.0) 
(and (<= x7 (- 2.7947782041 0.3068522393)) 
(and (>= x7 0) 
(and (<= (+ x8 0.8466824714) z) 
(and (<= 0.1747261502 y8) 
(and (<= y8 1.0) 
(and (<= x8 (- 2.7947782041 0.8466824714)) 
(and (>= x8 0) 
(and (<= (+ x9 0.0846078401) z) 
(and (<= 0.0375467832 y9) 
(and (<= y9 1.0) 
(and (<= x9 (- 2.7947782041 0.0846078401)) 
(and (>= x9 0) 
(and (<= (+ x10 0.52683142) z) 
(and (<= 0.0296638509 y10) 
(and (<= y10 1.0) 
(and (<= x10 (- 2.7947782041 0.52683142)) 
(and (>= x10 0) 
(and (<= (+ x11 0.8110310132) z) 
(and (<= 0.0276247497 y11) 
(and (<= y11 1.0) 
(and (<= x11 (- 2.7947782041 0.8110310132)) 
(and (>= x11 0) 
(and (<= c 2.7947782041) 
(and (or (<= (+ x0 0.3235560465) x1) (or (<= (+ x1 0.3625888386) x0) (or (>= (- y0 0.9147586828) y1) (or (>= (- y1 0.7575202458) y0))))) 
(and (or (<= (+ x0 0.3235560465) x2) (or (<= (+ x2 0.5024634312) x0) (or (>= (- y0 0.9147586828) y2) (or (>= (- y2 0.7338262769) y0))))) 
(and (or (<= (+ x0 0.3235560465) x3) (or (<= (+ x3 0.914811935) x0) (or (>= (- y0 0.9147586828) y3) (or (>= (- y3 0.6826210825) y0))))) 
(and (or (<= (+ x0 0.3235560465) x4) (or (<= (+ x4 0.0202771474) x0) (or (>= (- y0 0.9147586828) y4) (or (>= (- y4 0.6806613563) y0))))) 
(and (or (<= (+ x0 0.3235560465) x5) (or (<= (+ x5 0.6710808054) x0) (or (>= (- y0 0.9147586828) y5) (or (>= (- y5 0.3962154769) y0))))) 
(and (or (<= (+ x0 0.3235560465) x6) (or (<= (+ x6 0.3925057916) x0) (or (>= (- y0 0.9147586828) y6) (or (>= (- y6 0.3650112443) y0))))) 
(and (or (<= (+ x0 0.3235560465) x7) (or (<= (+ x7 0.3068522393) x0) (or (>= (- y0 0.9147586828) y7) (or (>= (- y7 0.1750962858) y0))))) 
(and (or (<= (+ x0 0.3235560465) x8) (or (<= (+ x8 0.8466824714) x0) (or (>= (- y0 0.9147586828) y8) (or (>= (- y8 0.1747261502) y0))))) 
(and (or (<= (+ x0 0.3235560465) x9) (or (<= (+ x9 0.0846078401) x0) (or (>= (- y0 0.9147586828) y9) (or (>= (- y9 0.0375467832) y0))))) 
(and (or (<= (+ x0 0.3235560465) x10) (or (<= (+ x10 0.52683142) x0) (or (>= (- y0 0.9147586828) y10) (or (>= (- y10 0.0296638509) y0))))) 
(and (or (<= (+ x0 0.3235560465) x11) (or (<= (+ x11 0.8110310132) x0) (or (>= (- y0 0.9147586828) y11) (or (>= (- y11 0.0276247497) y0))))) 
(and (or (<= (+ x1 0.3625888386) x2) (or (<= (+ x2 0.5024634312) x1) (or (>= (- y1 0.7575202458) y2) (or (>= (- y2 0.7338262769) y1))))) 
(and (or (<= (+ x1 0.3625888386) x3) (or (<= (+ x3 0.914811935) x1) (or (>= (- y1 0.7575202458) y3) (or (>= (- y3 0.6826210825) y1))))) 
(and (or (<= (+ x1 0.3625888386) x4) (or (<= (+ x4 0.0202771474) x1) (or (>= (- y1 0.7575202458) y4) (or (>= (- y4 0.6806613563) y1))))) 
(and (or (<= (+ x1 0.3625888386) x5) (or (<= (+ x5 0.6710808054) x1) (or (>= (- y1 0.7575202458) y5) (or (>= (- y5 0.3962154769) y1))))) 
(and (or (<= (+ x1 0.3625888386) x6) (or (<= (+ x6 0.3925057916) x1) (or (>= (- y1 0.7575202458) y6) (or (>= (- y6 0.3650112443) y1))))) 
(and (or (<= (+ x1 0.3625888386) x7) (or (<= (+ x7 0.3068522393) x1) (or (>= (- y1 0.7575202458) y7) (or (>= (- y7 0.1750962858) y1))))) 
(and (or (<= (+ x1 0.3625888386) x8) (or (<= (+ x8 0.8466824714) x1) (or (>= (- y1 0.7575202458) y8) (or (>= (- y8 0.1747261502) y1))))) 
(and (or (<= (+ x1 0.3625888386) x9) (or (<= (+ x9 0.0846078401) x1) (or (>= (- y1 0.7575202458) y9) (or (>= (- y9 0.0375467832) y1))))) 
(and (or (<= (+ x1 0.3625888386) x10) (or (<= (+ x10 0.52683142) x1) (or (>= (- y1 0.7575202458) y10) (or (>= (- y10 0.0296638509) y1))))) 
(and (or (<= (+ x1 0.3625888386) x11) (or (<= (+ x11 0.8110310132) x1) (or (>= (- y1 0.7575202458) y11) (or (>= (- y11 0.0276247497) y1))))) 
(and (or (<= (+ x2 0.5024634312) x3) (or (<= (+ x3 0.914811935) x2) (or (>= (- y2 0.7338262769) y3) (or (>= (- y3 0.6826210825) y2))))) 
(and (or (<= (+ x2 0.5024634312) x4) (or (<= (+ x4 0.0202771474) x2) (or (>= (- y2 0.7338262769) y4) (or (>= (- y4 0.6806613563) y2))))) 
(and (or (<= (+ x2 0.5024634312) x5) (or (<= (+ x5 0.6710808054) x2) (or (>= (- y2 0.7338262769) y5) (or (>= (- y5 0.3962154769) y2))))) 
(and (or (<= (+ x2 0.5024634312) x6) (or (<= (+ x6 0.3925057916) x2) (or (>= (- y2 0.7338262769) y6) (or (>= (- y6 0.3650112443) y2))))) 
(and (or (<= (+ x2 0.5024634312) x7) (or (<= (+ x7 0.3068522393) x2) (or (>= (- y2 0.7338262769) y7) (or (>= (- y7 0.1750962858) y2))))) 
(and (or (<= (+ x2 0.5024634312) x8) (or (<= (+ x8 0.8466824714) x2) (or (>= (- y2 0.7338262769) y8) (or (>= (- y8 0.1747261502) y2))))) 
(and (or (<= (+ x2 0.5024634312) x9) (or (<= (+ x9 0.0846078401) x2) (or (>= (- y2 0.7338262769) y9) (or (>= (- y9 0.0375467832) y2))))) 
(and (or (<= (+ x2 0.5024634312) x10) (or (<= (+ x10 0.52683142) x2) (or (>= (- y2 0.7338262769) y10) (or (>= (- y10 0.0296638509) y2))))) 
(and (or (<= (+ x2 0.5024634312) x11) (or (<= (+ x11 0.8110310132) x2) (or (>= (- y2 0.7338262769) y11) (or (>= (- y11 0.0276247497) y2))))) 
(and (or (<= (+ x3 0.914811935) x4) (or (<= (+ x4 0.0202771474) x3) (or (>= (- y3 0.6826210825) y4) (or (>= (- y4 0.6806613563) y3))))) 
(and (or (<= (+ x3 0.914811935) x5) (or (<= (+ x5 0.6710808054) x3) (or (>= (- y3 0.6826210825) y5) (or (>= (- y5 0.3962154769) y3))))) 
(and (or (<= (+ x3 0.914811935) x6) (or (<= (+ x6 0.3925057916) x3) (or (>= (- y3 0.6826210825) y6) (or (>= (- y6 0.3650112443) y3))))) 
(and (or (<= (+ x3 0.914811935) x7) (or (<= (+ x7 0.3068522393) x3) (or (>= (- y3 0.6826210825) y7) (or (>= (- y7 0.1750962858) y3))))) 
(and (or (<= (+ x3 0.914811935) x8) (or (<= (+ x8 0.8466824714) x3) (or (>= (- y3 0.6826210825) y8) (or (>= (- y8 0.1747261502) y3))))) 
(and (or (<= (+ x3 0.914811935) x9) (or (<= (+ x9 0.0846078401) x3) (or (>= (- y3 0.6826210825) y9) (or (>= (- y9 0.0375467832) y3))))) 
(and (or (<= (+ x3 0.914811935) x10) (or (<= (+ x10 0.52683142) x3) (or (>= (- y3 0.6826210825) y10) (or (>= (- y10 0.0296638509) y3))))) 
(and (or (<= (+ x3 0.914811935) x11) (or (<= (+ x11 0.8110310132) x3) (or (>= (- y3 0.6826210825) y11) (or (>= (- y11 0.0276247497) y3))))) 
(and (or (<= (+ x4 0.0202771474) x5) (or (<= (+ x5 0.6710808054) x4) (or (>= (- y4 0.6806613563) y5) (or (>= (- y5 0.3962154769) y4))))) 
(and (or (<= (+ x4 0.0202771474) x6) (or (<= (+ x6 0.3925057916) x4) (or (>= (- y4 0.6806613563) y6) (or (>= (- y6 0.3650112443) y4))))) 
(and (or (<= (+ x4 0.0202771474) x7) (or (<= (+ x7 0.3068522393) x4) (or (>= (- y4 0.6806613563) y7) (or (>= (- y7 0.1750962858) y4))))) 
(and (or (<= (+ x4 0.0202771474) x8) (or (<= (+ x8 0.8466824714) x4) (or (>= (- y4 0.6806613563) y8) (or (>= (- y8 0.1747261502) y4))))) 
(and (or (<= (+ x4 0.0202771474) x9) (or (<= (+ x9 0.0846078401) x4) (or (>= (- y4 0.6806613563) y9) (or (>= (- y9 0.0375467832) y4))))) 
(and (or (<= (+ x4 0.0202771474) x10) (or (<= (+ x10 0.52683142) x4) (or (>= (- y4 0.6806613563) y10) (or (>= (- y10 0.0296638509) y4))))) 
(and (or (<= (+ x4 0.0202771474) x11) (or (<= (+ x11 0.8110310132) x4) (or (>= (- y4 0.6806613563) y11) (or (>= (- y11 0.0276247497) y4))))) 
(and (or (<= (+ x5 0.6710808054) x6) (or (<= (+ x6 0.3925057916) x5) (or (>= (- y5 0.3962154769) y6) (or (>= (- y6 0.3650112443) y5))))) 
(and (or (<= (+ x5 0.6710808054) x7) (or (<= (+ x7 0.3068522393) x5) (or (>= (- y5 0.3962154769) y7) (or (>= (- y7 0.1750962858) y5))))) 
(and (or (<= (+ x5 0.6710808054) x8) (or (<= (+ x8 0.8466824714) x5) (or (>= (- y5 0.3962154769) y8) (or (>= (- y8 0.1747261502) y5))))) 
(and (or (<= (+ x5 0.6710808054) x9) (or (<= (+ x9 0.0846078401) x5) (or (>= (- y5 0.3962154769) y9) (or (>= (- y9 0.0375467832) y5))))) 
(and (or (<= (+ x5 0.6710808054) x10) (or (<= (+ x10 0.52683142) x5) (or (>= (- y5 0.3962154769) y10) (or (>= (- y10 0.0296638509) y5))))) 
(and (or (<= (+ x5 0.6710808054) x11) (or (<= (+ x11 0.8110310132) x5) (or (>= (- y5 0.3962154769) y11) (or (>= (- y11 0.0276247497) y5))))) 
(and (or (<= (+ x6 0.3925057916) x7) (or (<= (+ x7 0.3068522393) x6) (or (>= (- y6 0.3650112443) y7) (or (>= (- y7 0.1750962858) y6))))) 
(and (or (<= (+ x6 0.3925057916) x8) (or (<= (+ x8 0.8466824714) x6) (or (>= (- y6 0.3650112443) y8) (or (>= (- y8 0.1747261502) y6))))) 
(and (or (<= (+ x6 0.3925057916) x9) (or (<= (+ x9 0.0846078401) x6) (or (>= (- y6 0.3650112443) y9) (or (>= (- y9 0.0375467832) y6))))) 
(and (or (<= (+ x6 0.3925057916) x10) (or (<= (+ x10 0.52683142) x6) (or (>= (- y6 0.3650112443) y10) (or (>= (- y10 0.0296638509) y6))))) 
(and (or (<= (+ x6 0.3925057916) x11) (or (<= (+ x11 0.8110310132) x6) (or (>= (- y6 0.3650112443) y11) (or (>= (- y11 0.0276247497) y6))))) 
(and (or (<= (+ x7 0.3068522393) x8) (or (<= (+ x8 0.8466824714) x7) (or (>= (- y7 0.1750962858) y8) (or (>= (- y8 0.1747261502) y7))))) 
(and (or (<= (+ x7 0.3068522393) x9) (or (<= (+ x9 0.0846078401) x7) (or (>= (- y7 0.1750962858) y9) (or (>= (- y9 0.0375467832) y7))))) 
(and (or (<= (+ x7 0.3068522393) x10) (or (<= (+ x10 0.52683142) x7) (or (>= (- y7 0.1750962858) y10) (or (>= (- y10 0.0296638509) y7))))) 
(and (or (<= (+ x7 0.3068522393) x11) (or (<= (+ x11 0.8110310132) x7) (or (>= (- y7 0.1750962858) y11) (or (>= (- y11 0.0276247497) y7))))) 
(and (or (<= (+ x8 0.8466824714) x9) (or (<= (+ x9 0.0846078401) x8) (or (>= (- y8 0.1747261502) y9) (or (>= (- y9 0.0375467832) y8))))) 
(and (or (<= (+ x8 0.8466824714) x10) (or (<= (+ x10 0.52683142) x8) (or (>= (- y8 0.1747261502) y10) (or (>= (- y10 0.0296638509) y8))))) 
(and (or (<= (+ x8 0.8466824714) x11) (or (<= (+ x11 0.8110310132) x8) (or (>= (- y8 0.1747261502) y11) (or (>= (- y11 0.0276247497) y8))))) 
(and (or (<= (+ x9 0.0846078401) x10) (or (<= (+ x10 0.52683142) x9) (or (>= (- y9 0.0375467832) y10) (or (>= (- y10 0.0296638509) y9))))) 
(and (or (<= (+ x9 0.0846078401) x11) (or (<= (+ x11 0.8110310132) x9) (or (>= (- y9 0.0375467832) y11) (or (>= (- y11 0.0276247497) y9))))) 
(and (or (<= (+ x10 0.52683142) x11) (or (<= (+ x11 0.8110310132) x10) (or (>= (- y10 0.0296638509) y11) (or (>= (- y11 0.0276247497) y10))))) )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)