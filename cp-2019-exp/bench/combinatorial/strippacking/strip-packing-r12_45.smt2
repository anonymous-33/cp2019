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
(and (<= (+ x0 0.9276663923) z) 
(and (<= 0.9889636329 y0) 
(and (<= y0 1.73205080757) 
(and (<= x0 (- 4.3608978605 0.9276663923)) 
(and (>= x0 0) 
(and (<= (+ x1 0.7161497041) z) 
(and (<= 0.8822936344 y1) 
(and (<= y1 1.73205080757) 
(and (<= x1 (- 4.3608978605 0.7161497041)) 
(and (>= x1 0) 
(and (<= (+ x2 0.2630323756) z) 
(and (<= 0.7889897004 y2) 
(and (<= y2 1.73205080757) 
(and (<= x2 (- 4.3608978605 0.2630323756)) 
(and (>= x2 0) 
(and (<= (+ x3 0.8277888051) z) 
(and (<= 0.7481370095 y3) 
(and (<= y3 1.73205080757) 
(and (<= x3 (- 4.3608978605 0.8277888051)) 
(and (>= x3 0) 
(and (<= (+ x4 0.9181206576) z) 
(and (<= 0.661266513 y4) 
(and (<= y4 1.73205080757) 
(and (<= x4 (- 4.3608978605 0.9181206576)) 
(and (>= x4 0) 
(and (<= (+ x5 0.9250486745) z) 
(and (<= 0.5918686156 y5) 
(and (<= y5 1.73205080757) 
(and (<= x5 (- 4.3608978605 0.9250486745)) 
(and (>= x5 0) 
(and (<= (+ x6 0.7281245856) z) 
(and (<= 0.5119717921 y6) 
(and (<= y6 1.73205080757) 
(and (<= x6 (- 4.3608978605 0.7281245856)) 
(and (>= x6 0) 
(and (<= (+ x7 0.9642442845) z) 
(and (<= 0.3750624428 y7) 
(and (<= y7 1.73205080757) 
(and (<= x7 (- 4.3608978605 0.9642442845)) 
(and (>= x7 0) 
(and (<= (+ x8 0.1519234198) z) 
(and (<= 0.2826982779 y8) 
(and (<= y8 1.73205080757) 
(and (<= x8 (- 4.3608978605 0.1519234198)) 
(and (>= x8 0) 
(and (<= (+ x9 0.6889617752) z) 
(and (<= 0.2565292072 y9) 
(and (<= y9 1.73205080757) 
(and (<= x9 (- 4.3608978605 0.6889617752)) 
(and (>= x9 0) 
(and (<= (+ x10 0.8649888391) z) 
(and (<= 0.2049287565 y10) 
(and (<= y10 1.73205080757) 
(and (<= x10 (- 4.3608978605 0.8649888391)) 
(and (>= x10 0) 
(and (<= (+ x11 0.2995489086) z) 
(and (<= 0.0770417524 y11) 
(and (<= y11 1.73205080757) 
(and (<= x11 (- 4.3608978605 0.2995489086)) 
(and (>= x11 0) 
(and (<= c 4.3608978605) 
(and (or (<= (+ x0 0.9276663923) x1) (or (<= (+ x1 0.7161497041) x0) (or (>= (- y0 0.9889636329) y1) (or (>= (- y1 0.8822936344) y0))))) 
(and (or (<= (+ x0 0.9276663923) x2) (or (<= (+ x2 0.2630323756) x0) (or (>= (- y0 0.9889636329) y2) (or (>= (- y2 0.7889897004) y0))))) 
(and (or (<= (+ x0 0.9276663923) x3) (or (<= (+ x3 0.8277888051) x0) (or (>= (- y0 0.9889636329) y3) (or (>= (- y3 0.7481370095) y0))))) 
(and (or (<= (+ x0 0.9276663923) x4) (or (<= (+ x4 0.9181206576) x0) (or (>= (- y0 0.9889636329) y4) (or (>= (- y4 0.661266513) y0))))) 
(and (or (<= (+ x0 0.9276663923) x5) (or (<= (+ x5 0.9250486745) x0) (or (>= (- y0 0.9889636329) y5) (or (>= (- y5 0.5918686156) y0))))) 
(and (or (<= (+ x0 0.9276663923) x6) (or (<= (+ x6 0.7281245856) x0) (or (>= (- y0 0.9889636329) y6) (or (>= (- y6 0.5119717921) y0))))) 
(and (or (<= (+ x0 0.9276663923) x7) (or (<= (+ x7 0.9642442845) x0) (or (>= (- y0 0.9889636329) y7) (or (>= (- y7 0.3750624428) y0))))) 
(and (or (<= (+ x0 0.9276663923) x8) (or (<= (+ x8 0.1519234198) x0) (or (>= (- y0 0.9889636329) y8) (or (>= (- y8 0.2826982779) y0))))) 
(and (or (<= (+ x0 0.9276663923) x9) (or (<= (+ x9 0.6889617752) x0) (or (>= (- y0 0.9889636329) y9) (or (>= (- y9 0.2565292072) y0))))) 
(and (or (<= (+ x0 0.9276663923) x10) (or (<= (+ x10 0.8649888391) x0) (or (>= (- y0 0.9889636329) y10) (or (>= (- y10 0.2049287565) y0))))) 
(and (or (<= (+ x0 0.9276663923) x11) (or (<= (+ x11 0.2995489086) x0) (or (>= (- y0 0.9889636329) y11) (or (>= (- y11 0.0770417524) y0))))) 
(and (or (<= (+ x1 0.7161497041) x2) (or (<= (+ x2 0.2630323756) x1) (or (>= (- y1 0.8822936344) y2) (or (>= (- y2 0.7889897004) y1))))) 
(and (or (<= (+ x1 0.7161497041) x3) (or (<= (+ x3 0.8277888051) x1) (or (>= (- y1 0.8822936344) y3) (or (>= (- y3 0.7481370095) y1))))) 
(and (or (<= (+ x1 0.7161497041) x4) (or (<= (+ x4 0.9181206576) x1) (or (>= (- y1 0.8822936344) y4) (or (>= (- y4 0.661266513) y1))))) 
(and (or (<= (+ x1 0.7161497041) x5) (or (<= (+ x5 0.9250486745) x1) (or (>= (- y1 0.8822936344) y5) (or (>= (- y5 0.5918686156) y1))))) 
(and (or (<= (+ x1 0.7161497041) x6) (or (<= (+ x6 0.7281245856) x1) (or (>= (- y1 0.8822936344) y6) (or (>= (- y6 0.5119717921) y1))))) 
(and (or (<= (+ x1 0.7161497041) x7) (or (<= (+ x7 0.9642442845) x1) (or (>= (- y1 0.8822936344) y7) (or (>= (- y7 0.3750624428) y1))))) 
(and (or (<= (+ x1 0.7161497041) x8) (or (<= (+ x8 0.1519234198) x1) (or (>= (- y1 0.8822936344) y8) (or (>= (- y8 0.2826982779) y1))))) 
(and (or (<= (+ x1 0.7161497041) x9) (or (<= (+ x9 0.6889617752) x1) (or (>= (- y1 0.8822936344) y9) (or (>= (- y9 0.2565292072) y1))))) 
(and (or (<= (+ x1 0.7161497041) x10) (or (<= (+ x10 0.8649888391) x1) (or (>= (- y1 0.8822936344) y10) (or (>= (- y10 0.2049287565) y1))))) 
(and (or (<= (+ x1 0.7161497041) x11) (or (<= (+ x11 0.2995489086) x1) (or (>= (- y1 0.8822936344) y11) (or (>= (- y11 0.0770417524) y1))))) 
(and (or (<= (+ x2 0.2630323756) x3) (or (<= (+ x3 0.8277888051) x2) (or (>= (- y2 0.7889897004) y3) (or (>= (- y3 0.7481370095) y2))))) 
(and (or (<= (+ x2 0.2630323756) x4) (or (<= (+ x4 0.9181206576) x2) (or (>= (- y2 0.7889897004) y4) (or (>= (- y4 0.661266513) y2))))) 
(and (or (<= (+ x2 0.2630323756) x5) (or (<= (+ x5 0.9250486745) x2) (or (>= (- y2 0.7889897004) y5) (or (>= (- y5 0.5918686156) y2))))) 
(and (or (<= (+ x2 0.2630323756) x6) (or (<= (+ x6 0.7281245856) x2) (or (>= (- y2 0.7889897004) y6) (or (>= (- y6 0.5119717921) y2))))) 
(and (or (<= (+ x2 0.2630323756) x7) (or (<= (+ x7 0.9642442845) x2) (or (>= (- y2 0.7889897004) y7) (or (>= (- y7 0.3750624428) y2))))) 
(and (or (<= (+ x2 0.2630323756) x8) (or (<= (+ x8 0.1519234198) x2) (or (>= (- y2 0.7889897004) y8) (or (>= (- y8 0.2826982779) y2))))) 
(and (or (<= (+ x2 0.2630323756) x9) (or (<= (+ x9 0.6889617752) x2) (or (>= (- y2 0.7889897004) y9) (or (>= (- y9 0.2565292072) y2))))) 
(and (or (<= (+ x2 0.2630323756) x10) (or (<= (+ x10 0.8649888391) x2) (or (>= (- y2 0.7889897004) y10) (or (>= (- y10 0.2049287565) y2))))) 
(and (or (<= (+ x2 0.2630323756) x11) (or (<= (+ x11 0.2995489086) x2) (or (>= (- y2 0.7889897004) y11) (or (>= (- y11 0.0770417524) y2))))) 
(and (or (<= (+ x3 0.8277888051) x4) (or (<= (+ x4 0.9181206576) x3) (or (>= (- y3 0.7481370095) y4) (or (>= (- y4 0.661266513) y3))))) 
(and (or (<= (+ x3 0.8277888051) x5) (or (<= (+ x5 0.9250486745) x3) (or (>= (- y3 0.7481370095) y5) (or (>= (- y5 0.5918686156) y3))))) 
(and (or (<= (+ x3 0.8277888051) x6) (or (<= (+ x6 0.7281245856) x3) (or (>= (- y3 0.7481370095) y6) (or (>= (- y6 0.5119717921) y3))))) 
(and (or (<= (+ x3 0.8277888051) x7) (or (<= (+ x7 0.9642442845) x3) (or (>= (- y3 0.7481370095) y7) (or (>= (- y7 0.3750624428) y3))))) 
(and (or (<= (+ x3 0.8277888051) x8) (or (<= (+ x8 0.1519234198) x3) (or (>= (- y3 0.7481370095) y8) (or (>= (- y8 0.2826982779) y3))))) 
(and (or (<= (+ x3 0.8277888051) x9) (or (<= (+ x9 0.6889617752) x3) (or (>= (- y3 0.7481370095) y9) (or (>= (- y9 0.2565292072) y3))))) 
(and (or (<= (+ x3 0.8277888051) x10) (or (<= (+ x10 0.8649888391) x3) (or (>= (- y3 0.7481370095) y10) (or (>= (- y10 0.2049287565) y3))))) 
(and (or (<= (+ x3 0.8277888051) x11) (or (<= (+ x11 0.2995489086) x3) (or (>= (- y3 0.7481370095) y11) (or (>= (- y11 0.0770417524) y3))))) 
(and (or (<= (+ x4 0.9181206576) x5) (or (<= (+ x5 0.9250486745) x4) (or (>= (- y4 0.661266513) y5) (or (>= (- y5 0.5918686156) y4))))) 
(and (or (<= (+ x4 0.9181206576) x6) (or (<= (+ x6 0.7281245856) x4) (or (>= (- y4 0.661266513) y6) (or (>= (- y6 0.5119717921) y4))))) 
(and (or (<= (+ x4 0.9181206576) x7) (or (<= (+ x7 0.9642442845) x4) (or (>= (- y4 0.661266513) y7) (or (>= (- y7 0.3750624428) y4))))) 
(and (or (<= (+ x4 0.9181206576) x8) (or (<= (+ x8 0.1519234198) x4) (or (>= (- y4 0.661266513) y8) (or (>= (- y8 0.2826982779) y4))))) 
(and (or (<= (+ x4 0.9181206576) x9) (or (<= (+ x9 0.6889617752) x4) (or (>= (- y4 0.661266513) y9) (or (>= (- y9 0.2565292072) y4))))) 
(and (or (<= (+ x4 0.9181206576) x10) (or (<= (+ x10 0.8649888391) x4) (or (>= (- y4 0.661266513) y10) (or (>= (- y10 0.2049287565) y4))))) 
(and (or (<= (+ x4 0.9181206576) x11) (or (<= (+ x11 0.2995489086) x4) (or (>= (- y4 0.661266513) y11) (or (>= (- y11 0.0770417524) y4))))) 
(and (or (<= (+ x5 0.9250486745) x6) (or (<= (+ x6 0.7281245856) x5) (or (>= (- y5 0.5918686156) y6) (or (>= (- y6 0.5119717921) y5))))) 
(and (or (<= (+ x5 0.9250486745) x7) (or (<= (+ x7 0.9642442845) x5) (or (>= (- y5 0.5918686156) y7) (or (>= (- y7 0.3750624428) y5))))) 
(and (or (<= (+ x5 0.9250486745) x8) (or (<= (+ x8 0.1519234198) x5) (or (>= (- y5 0.5918686156) y8) (or (>= (- y8 0.2826982779) y5))))) 
(and (or (<= (+ x5 0.9250486745) x9) (or (<= (+ x9 0.6889617752) x5) (or (>= (- y5 0.5918686156) y9) (or (>= (- y9 0.2565292072) y5))))) 
(and (or (<= (+ x5 0.9250486745) x10) (or (<= (+ x10 0.8649888391) x5) (or (>= (- y5 0.5918686156) y10) (or (>= (- y10 0.2049287565) y5))))) 
(and (or (<= (+ x5 0.9250486745) x11) (or (<= (+ x11 0.2995489086) x5) (or (>= (- y5 0.5918686156) y11) (or (>= (- y11 0.0770417524) y5))))) 
(and (or (<= (+ x6 0.7281245856) x7) (or (<= (+ x7 0.9642442845) x6) (or (>= (- y6 0.5119717921) y7) (or (>= (- y7 0.3750624428) y6))))) 
(and (or (<= (+ x6 0.7281245856) x8) (or (<= (+ x8 0.1519234198) x6) (or (>= (- y6 0.5119717921) y8) (or (>= (- y8 0.2826982779) y6))))) 
(and (or (<= (+ x6 0.7281245856) x9) (or (<= (+ x9 0.6889617752) x6) (or (>= (- y6 0.5119717921) y9) (or (>= (- y9 0.2565292072) y6))))) 
(and (or (<= (+ x6 0.7281245856) x10) (or (<= (+ x10 0.8649888391) x6) (or (>= (- y6 0.5119717921) y10) (or (>= (- y10 0.2049287565) y6))))) 
(and (or (<= (+ x6 0.7281245856) x11) (or (<= (+ x11 0.2995489086) x6) (or (>= (- y6 0.5119717921) y11) (or (>= (- y11 0.0770417524) y6))))) 
(and (or (<= (+ x7 0.9642442845) x8) (or (<= (+ x8 0.1519234198) x7) (or (>= (- y7 0.3750624428) y8) (or (>= (- y8 0.2826982779) y7))))) 
(and (or (<= (+ x7 0.9642442845) x9) (or (<= (+ x9 0.6889617752) x7) (or (>= (- y7 0.3750624428) y9) (or (>= (- y9 0.2565292072) y7))))) 
(and (or (<= (+ x7 0.9642442845) x10) (or (<= (+ x10 0.8649888391) x7) (or (>= (- y7 0.3750624428) y10) (or (>= (- y10 0.2049287565) y7))))) 
(and (or (<= (+ x7 0.9642442845) x11) (or (<= (+ x11 0.2995489086) x7) (or (>= (- y7 0.3750624428) y11) (or (>= (- y11 0.0770417524) y7))))) 
(and (or (<= (+ x8 0.1519234198) x9) (or (<= (+ x9 0.6889617752) x8) (or (>= (- y8 0.2826982779) y9) (or (>= (- y9 0.2565292072) y8))))) 
(and (or (<= (+ x8 0.1519234198) x10) (or (<= (+ x10 0.8649888391) x8) (or (>= (- y8 0.2826982779) y10) (or (>= (- y10 0.2049287565) y8))))) 
(and (or (<= (+ x8 0.1519234198) x11) (or (<= (+ x11 0.2995489086) x8) (or (>= (- y8 0.2826982779) y11) (or (>= (- y11 0.0770417524) y8))))) 
(and (or (<= (+ x9 0.6889617752) x10) (or (<= (+ x10 0.8649888391) x9) (or (>= (- y9 0.2565292072) y10) (or (>= (- y10 0.2049287565) y9))))) 
(and (or (<= (+ x9 0.6889617752) x11) (or (<= (+ x11 0.2995489086) x9) (or (>= (- y9 0.2565292072) y11) (or (>= (- y11 0.0770417524) y9))))) 
(and (or (<= (+ x10 0.8649888391) x11) (or (<= (+ x11 0.2995489086) x10) (or (>= (- y10 0.2049287565) y11) (or (>= (- y11 0.0770417524) y10))))) )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)