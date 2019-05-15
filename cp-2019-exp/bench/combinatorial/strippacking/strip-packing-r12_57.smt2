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
(and (<= (+ x0 0.1160129132) z) 
(and (<= 0.980329373 y0) 
(and (<= y0 1.73205080757) 
(and (<= x0 (- 2.2434425957 0.1160129132)) 
(and (>= x0 0) 
(and (<= (+ x1 0.0233538637) z) 
(and (<= 0.7097531931 y1) 
(and (<= y1 1.73205080757) 
(and (<= x1 (- 2.2434425957 0.0233538637)) 
(and (>= x1 0) 
(and (<= (+ x2 0.395654385) z) 
(and (<= 0.6220204055 y2) 
(and (<= y2 1.73205080757) 
(and (<= x2 (- 2.2434425957 0.395654385)) 
(and (>= x2 0) 
(and (<= (+ x3 0.9806891887) z) 
(and (<= 0.4858738607 y3) 
(and (<= y3 1.73205080757) 
(and (<= x3 (- 2.2434425957 0.9806891887)) 
(and (>= x3 0) 
(and (<= (+ x4 0.2643560084) z) 
(and (<= 0.483295799 y4) 
(and (<= y4 1.73205080757) 
(and (<= x4 (- 2.2434425957 0.2643560084)) 
(and (>= x4 0) 
(and (<= (+ x5 0.8605762692) z) 
(and (<= 0.4436882064 y5) 
(and (<= y5 1.73205080757) 
(and (<= x5 (- 2.2434425957 0.8605762692)) 
(and (>= x5 0) 
(and (<= (+ x6 0.3837313716) z) 
(and (<= 0.4347293739 y6) 
(and (<= y6 1.73205080757) 
(and (<= x6 (- 2.2434425957 0.3837313716)) 
(and (>= x6 0) 
(and (<= (+ x7 0.9574342864) z) 
(and (<= 0.4103135496 y7) 
(and (<= y7 1.73205080757) 
(and (<= x7 (- 2.2434425957 0.9574342864)) 
(and (>= x7 0) 
(and (<= (+ x8 0.025780153) z) 
(and (<= 0.3639688281 y8) 
(and (<= y8 1.73205080757) 
(and (<= x8 (- 2.2434425957 0.025780153)) 
(and (>= x8 0) 
(and (<= (+ x9 0.0230266146) z) 
(and (<= 0.3447233969 y9) 
(and (<= y9 1.73205080757) 
(and (<= x9 (- 2.2434425957 0.0230266146)) 
(and (>= x9 0) 
(and (<= (+ x10 0.2744219409) z) 
(and (<= 0.3167628461 y10) 
(and (<= y10 1.73205080757) 
(and (<= x10 (- 2.2434425957 0.2744219409)) 
(and (>= x10 0) 
(and (<= (+ x11 0.4536375533) z) 
(and (<= 0.1865829479 y11) 
(and (<= y11 1.73205080757) 
(and (<= x11 (- 2.2434425957 0.4536375533)) 
(and (>= x11 0) 
(and (<= c 2.2434425957) 
(and (or (<= (+ x0 0.1160129132) x1) (or (<= (+ x1 0.0233538637) x0) (or (>= (- y0 0.980329373) y1) (or (>= (- y1 0.7097531931) y0))))) 
(and (or (<= (+ x0 0.1160129132) x2) (or (<= (+ x2 0.395654385) x0) (or (>= (- y0 0.980329373) y2) (or (>= (- y2 0.6220204055) y0))))) 
(and (or (<= (+ x0 0.1160129132) x3) (or (<= (+ x3 0.9806891887) x0) (or (>= (- y0 0.980329373) y3) (or (>= (- y3 0.4858738607) y0))))) 
(and (or (<= (+ x0 0.1160129132) x4) (or (<= (+ x4 0.2643560084) x0) (or (>= (- y0 0.980329373) y4) (or (>= (- y4 0.483295799) y0))))) 
(and (or (<= (+ x0 0.1160129132) x5) (or (<= (+ x5 0.8605762692) x0) (or (>= (- y0 0.980329373) y5) (or (>= (- y5 0.4436882064) y0))))) 
(and (or (<= (+ x0 0.1160129132) x6) (or (<= (+ x6 0.3837313716) x0) (or (>= (- y0 0.980329373) y6) (or (>= (- y6 0.4347293739) y0))))) 
(and (or (<= (+ x0 0.1160129132) x7) (or (<= (+ x7 0.9574342864) x0) (or (>= (- y0 0.980329373) y7) (or (>= (- y7 0.4103135496) y0))))) 
(and (or (<= (+ x0 0.1160129132) x8) (or (<= (+ x8 0.025780153) x0) (or (>= (- y0 0.980329373) y8) (or (>= (- y8 0.3639688281) y0))))) 
(and (or (<= (+ x0 0.1160129132) x9) (or (<= (+ x9 0.0230266146) x0) (or (>= (- y0 0.980329373) y9) (or (>= (- y9 0.3447233969) y0))))) 
(and (or (<= (+ x0 0.1160129132) x10) (or (<= (+ x10 0.2744219409) x0) (or (>= (- y0 0.980329373) y10) (or (>= (- y10 0.3167628461) y0))))) 
(and (or (<= (+ x0 0.1160129132) x11) (or (<= (+ x11 0.4536375533) x0) (or (>= (- y0 0.980329373) y11) (or (>= (- y11 0.1865829479) y0))))) 
(and (or (<= (+ x1 0.0233538637) x2) (or (<= (+ x2 0.395654385) x1) (or (>= (- y1 0.7097531931) y2) (or (>= (- y2 0.6220204055) y1))))) 
(and (or (<= (+ x1 0.0233538637) x3) (or (<= (+ x3 0.9806891887) x1) (or (>= (- y1 0.7097531931) y3) (or (>= (- y3 0.4858738607) y1))))) 
(and (or (<= (+ x1 0.0233538637) x4) (or (<= (+ x4 0.2643560084) x1) (or (>= (- y1 0.7097531931) y4) (or (>= (- y4 0.483295799) y1))))) 
(and (or (<= (+ x1 0.0233538637) x5) (or (<= (+ x5 0.8605762692) x1) (or (>= (- y1 0.7097531931) y5) (or (>= (- y5 0.4436882064) y1))))) 
(and (or (<= (+ x1 0.0233538637) x6) (or (<= (+ x6 0.3837313716) x1) (or (>= (- y1 0.7097531931) y6) (or (>= (- y6 0.4347293739) y1))))) 
(and (or (<= (+ x1 0.0233538637) x7) (or (<= (+ x7 0.9574342864) x1) (or (>= (- y1 0.7097531931) y7) (or (>= (- y7 0.4103135496) y1))))) 
(and (or (<= (+ x1 0.0233538637) x8) (or (<= (+ x8 0.025780153) x1) (or (>= (- y1 0.7097531931) y8) (or (>= (- y8 0.3639688281) y1))))) 
(and (or (<= (+ x1 0.0233538637) x9) (or (<= (+ x9 0.0230266146) x1) (or (>= (- y1 0.7097531931) y9) (or (>= (- y9 0.3447233969) y1))))) 
(and (or (<= (+ x1 0.0233538637) x10) (or (<= (+ x10 0.2744219409) x1) (or (>= (- y1 0.7097531931) y10) (or (>= (- y10 0.3167628461) y1))))) 
(and (or (<= (+ x1 0.0233538637) x11) (or (<= (+ x11 0.4536375533) x1) (or (>= (- y1 0.7097531931) y11) (or (>= (- y11 0.1865829479) y1))))) 
(and (or (<= (+ x2 0.395654385) x3) (or (<= (+ x3 0.9806891887) x2) (or (>= (- y2 0.6220204055) y3) (or (>= (- y3 0.4858738607) y2))))) 
(and (or (<= (+ x2 0.395654385) x4) (or (<= (+ x4 0.2643560084) x2) (or (>= (- y2 0.6220204055) y4) (or (>= (- y4 0.483295799) y2))))) 
(and (or (<= (+ x2 0.395654385) x5) (or (<= (+ x5 0.8605762692) x2) (or (>= (- y2 0.6220204055) y5) (or (>= (- y5 0.4436882064) y2))))) 
(and (or (<= (+ x2 0.395654385) x6) (or (<= (+ x6 0.3837313716) x2) (or (>= (- y2 0.6220204055) y6) (or (>= (- y6 0.4347293739) y2))))) 
(and (or (<= (+ x2 0.395654385) x7) (or (<= (+ x7 0.9574342864) x2) (or (>= (- y2 0.6220204055) y7) (or (>= (- y7 0.4103135496) y2))))) 
(and (or (<= (+ x2 0.395654385) x8) (or (<= (+ x8 0.025780153) x2) (or (>= (- y2 0.6220204055) y8) (or (>= (- y8 0.3639688281) y2))))) 
(and (or (<= (+ x2 0.395654385) x9) (or (<= (+ x9 0.0230266146) x2) (or (>= (- y2 0.6220204055) y9) (or (>= (- y9 0.3447233969) y2))))) 
(and (or (<= (+ x2 0.395654385) x10) (or (<= (+ x10 0.2744219409) x2) (or (>= (- y2 0.6220204055) y10) (or (>= (- y10 0.3167628461) y2))))) 
(and (or (<= (+ x2 0.395654385) x11) (or (<= (+ x11 0.4536375533) x2) (or (>= (- y2 0.6220204055) y11) (or (>= (- y11 0.1865829479) y2))))) 
(and (or (<= (+ x3 0.9806891887) x4) (or (<= (+ x4 0.2643560084) x3) (or (>= (- y3 0.4858738607) y4) (or (>= (- y4 0.483295799) y3))))) 
(and (or (<= (+ x3 0.9806891887) x5) (or (<= (+ x5 0.8605762692) x3) (or (>= (- y3 0.4858738607) y5) (or (>= (- y5 0.4436882064) y3))))) 
(and (or (<= (+ x3 0.9806891887) x6) (or (<= (+ x6 0.3837313716) x3) (or (>= (- y3 0.4858738607) y6) (or (>= (- y6 0.4347293739) y3))))) 
(and (or (<= (+ x3 0.9806891887) x7) (or (<= (+ x7 0.9574342864) x3) (or (>= (- y3 0.4858738607) y7) (or (>= (- y7 0.4103135496) y3))))) 
(and (or (<= (+ x3 0.9806891887) x8) (or (<= (+ x8 0.025780153) x3) (or (>= (- y3 0.4858738607) y8) (or (>= (- y8 0.3639688281) y3))))) 
(and (or (<= (+ x3 0.9806891887) x9) (or (<= (+ x9 0.0230266146) x3) (or (>= (- y3 0.4858738607) y9) (or (>= (- y9 0.3447233969) y3))))) 
(and (or (<= (+ x3 0.9806891887) x10) (or (<= (+ x10 0.2744219409) x3) (or (>= (- y3 0.4858738607) y10) (or (>= (- y10 0.3167628461) y3))))) 
(and (or (<= (+ x3 0.9806891887) x11) (or (<= (+ x11 0.4536375533) x3) (or (>= (- y3 0.4858738607) y11) (or (>= (- y11 0.1865829479) y3))))) 
(and (or (<= (+ x4 0.2643560084) x5) (or (<= (+ x5 0.8605762692) x4) (or (>= (- y4 0.483295799) y5) (or (>= (- y5 0.4436882064) y4))))) 
(and (or (<= (+ x4 0.2643560084) x6) (or (<= (+ x6 0.3837313716) x4) (or (>= (- y4 0.483295799) y6) (or (>= (- y6 0.4347293739) y4))))) 
(and (or (<= (+ x4 0.2643560084) x7) (or (<= (+ x7 0.9574342864) x4) (or (>= (- y4 0.483295799) y7) (or (>= (- y7 0.4103135496) y4))))) 
(and (or (<= (+ x4 0.2643560084) x8) (or (<= (+ x8 0.025780153) x4) (or (>= (- y4 0.483295799) y8) (or (>= (- y8 0.3639688281) y4))))) 
(and (or (<= (+ x4 0.2643560084) x9) (or (<= (+ x9 0.0230266146) x4) (or (>= (- y4 0.483295799) y9) (or (>= (- y9 0.3447233969) y4))))) 
(and (or (<= (+ x4 0.2643560084) x10) (or (<= (+ x10 0.2744219409) x4) (or (>= (- y4 0.483295799) y10) (or (>= (- y10 0.3167628461) y4))))) 
(and (or (<= (+ x4 0.2643560084) x11) (or (<= (+ x11 0.4536375533) x4) (or (>= (- y4 0.483295799) y11) (or (>= (- y11 0.1865829479) y4))))) 
(and (or (<= (+ x5 0.8605762692) x6) (or (<= (+ x6 0.3837313716) x5) (or (>= (- y5 0.4436882064) y6) (or (>= (- y6 0.4347293739) y5))))) 
(and (or (<= (+ x5 0.8605762692) x7) (or (<= (+ x7 0.9574342864) x5) (or (>= (- y5 0.4436882064) y7) (or (>= (- y7 0.4103135496) y5))))) 
(and (or (<= (+ x5 0.8605762692) x8) (or (<= (+ x8 0.025780153) x5) (or (>= (- y5 0.4436882064) y8) (or (>= (- y8 0.3639688281) y5))))) 
(and (or (<= (+ x5 0.8605762692) x9) (or (<= (+ x9 0.0230266146) x5) (or (>= (- y5 0.4436882064) y9) (or (>= (- y9 0.3447233969) y5))))) 
(and (or (<= (+ x5 0.8605762692) x10) (or (<= (+ x10 0.2744219409) x5) (or (>= (- y5 0.4436882064) y10) (or (>= (- y10 0.3167628461) y5))))) 
(and (or (<= (+ x5 0.8605762692) x11) (or (<= (+ x11 0.4536375533) x5) (or (>= (- y5 0.4436882064) y11) (or (>= (- y11 0.1865829479) y5))))) 
(and (or (<= (+ x6 0.3837313716) x7) (or (<= (+ x7 0.9574342864) x6) (or (>= (- y6 0.4347293739) y7) (or (>= (- y7 0.4103135496) y6))))) 
(and (or (<= (+ x6 0.3837313716) x8) (or (<= (+ x8 0.025780153) x6) (or (>= (- y6 0.4347293739) y8) (or (>= (- y8 0.3639688281) y6))))) 
(and (or (<= (+ x6 0.3837313716) x9) (or (<= (+ x9 0.0230266146) x6) (or (>= (- y6 0.4347293739) y9) (or (>= (- y9 0.3447233969) y6))))) 
(and (or (<= (+ x6 0.3837313716) x10) (or (<= (+ x10 0.2744219409) x6) (or (>= (- y6 0.4347293739) y10) (or (>= (- y10 0.3167628461) y6))))) 
(and (or (<= (+ x6 0.3837313716) x11) (or (<= (+ x11 0.4536375533) x6) (or (>= (- y6 0.4347293739) y11) (or (>= (- y11 0.1865829479) y6))))) 
(and (or (<= (+ x7 0.9574342864) x8) (or (<= (+ x8 0.025780153) x7) (or (>= (- y7 0.4103135496) y8) (or (>= (- y8 0.3639688281) y7))))) 
(and (or (<= (+ x7 0.9574342864) x9) (or (<= (+ x9 0.0230266146) x7) (or (>= (- y7 0.4103135496) y9) (or (>= (- y9 0.3447233969) y7))))) 
(and (or (<= (+ x7 0.9574342864) x10) (or (<= (+ x10 0.2744219409) x7) (or (>= (- y7 0.4103135496) y10) (or (>= (- y10 0.3167628461) y7))))) 
(and (or (<= (+ x7 0.9574342864) x11) (or (<= (+ x11 0.4536375533) x7) (or (>= (- y7 0.4103135496) y11) (or (>= (- y11 0.1865829479) y7))))) 
(and (or (<= (+ x8 0.025780153) x9) (or (<= (+ x9 0.0230266146) x8) (or (>= (- y8 0.3639688281) y9) (or (>= (- y9 0.3447233969) y8))))) 
(and (or (<= (+ x8 0.025780153) x10) (or (<= (+ x10 0.2744219409) x8) (or (>= (- y8 0.3639688281) y10) (or (>= (- y10 0.3167628461) y8))))) 
(and (or (<= (+ x8 0.025780153) x11) (or (<= (+ x11 0.4536375533) x8) (or (>= (- y8 0.3639688281) y11) (or (>= (- y11 0.1865829479) y8))))) 
(and (or (<= (+ x9 0.0230266146) x10) (or (<= (+ x10 0.2744219409) x9) (or (>= (- y9 0.3447233969) y10) (or (>= (- y10 0.3167628461) y9))))) 
(and (or (<= (+ x9 0.0230266146) x11) (or (<= (+ x11 0.4536375533) x9) (or (>= (- y9 0.3447233969) y11) (or (>= (- y11 0.1865829479) y9))))) 
(and (or (<= (+ x10 0.2744219409) x11) (or (<= (+ x11 0.4536375533) x10) (or (>= (- y10 0.3167628461) y11) (or (>= (- y11 0.1865829479) y10))))) )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)