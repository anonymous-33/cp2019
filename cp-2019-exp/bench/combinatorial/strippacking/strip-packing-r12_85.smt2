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
(and (<= (+ x0 0.5693032137) z) 
(and (<= 0.9946107441 y0) 
(and (<= y0 1.73205080757) 
(and (<= x0 (- 3.8439597016 0.5693032137)) 
(and (>= x0 0) 
(and (<= (+ x1 0.4375984291) z) 
(and (<= 0.5691318403 y1) 
(and (<= y1 1.73205080757) 
(and (<= x1 (- 3.8439597016 0.4375984291)) 
(and (>= x1 0) 
(and (<= (+ x2 0.3806448528) z) 
(and (<= 0.5475063266 y2) 
(and (<= y2 1.73205080757) 
(and (<= x2 (- 3.8439597016 0.3806448528)) 
(and (>= x2 0) 
(and (<= (+ x3 0.8079232706) z) 
(and (<= 0.5387788581 y3) 
(and (<= y3 1.73205080757) 
(and (<= x3 (- 3.8439597016 0.8079232706)) 
(and (>= x3 0) 
(and (<= (+ x4 0.3987046214) z) 
(and (<= 0.5340624257 y4) 
(and (<= y4 1.73205080757) 
(and (<= x4 (- 3.8439597016 0.3987046214)) 
(and (>= x4 0) 
(and (<= (+ x5 0.8004112936) z) 
(and (<= 0.3849473982 y5) 
(and (<= y5 1.73205080757) 
(and (<= x5 (- 3.8439597016 0.8004112936)) 
(and (>= x5 0) 
(and (<= (+ x6 0.4177817388) z) 
(and (<= 0.3187779235 y6) 
(and (<= y6 1.73205080757) 
(and (<= x6 (- 3.8439597016 0.4177817388)) 
(and (>= x6 0) 
(and (<= (+ x7 0.0766915345) z) 
(and (<= 0.3159747777 y7) 
(and (<= y7 1.73205080757) 
(and (<= x7 (- 3.8439597016 0.0766915345)) 
(and (>= x7 0) 
(and (<= (+ x8 0.7754169496) z) 
(and (<= 0.3159323217 y8) 
(and (<= y8 1.73205080757) 
(and (<= x8 (- 3.8439597016 0.7754169496)) 
(and (>= x8 0) 
(and (<= (+ x9 0.4636189725) z) 
(and (<= 0.1537072171 y9) 
(and (<= y9 1.73205080757) 
(and (<= x9 (- 3.8439597016 0.4636189725)) 
(and (>= x9 0) 
(and (<= (+ x10 0.8928896761) z) 
(and (<= 0.0948221092 y10) 
(and (<= y10 1.73205080757) 
(and (<= x10 (- 3.8439597016 0.8928896761)) 
(and (>= x10 0) 
(and (<= (+ x11 0.2287630152) z) 
(and (<= 0.0920997534 y11) 
(and (<= y11 1.73205080757) 
(and (<= x11 (- 3.8439597016 0.2287630152)) 
(and (>= x11 0) 
(and (<= c 3.8439597016) 
(and (or (<= (+ x0 0.5693032137) x1) (or (<= (+ x1 0.4375984291) x0) (or (>= (- y0 0.9946107441) y1) (or (>= (- y1 0.5691318403) y0))))) 
(and (or (<= (+ x0 0.5693032137) x2) (or (<= (+ x2 0.3806448528) x0) (or (>= (- y0 0.9946107441) y2) (or (>= (- y2 0.5475063266) y0))))) 
(and (or (<= (+ x0 0.5693032137) x3) (or (<= (+ x3 0.8079232706) x0) (or (>= (- y0 0.9946107441) y3) (or (>= (- y3 0.5387788581) y0))))) 
(and (or (<= (+ x0 0.5693032137) x4) (or (<= (+ x4 0.3987046214) x0) (or (>= (- y0 0.9946107441) y4) (or (>= (- y4 0.5340624257) y0))))) 
(and (or (<= (+ x0 0.5693032137) x5) (or (<= (+ x5 0.8004112936) x0) (or (>= (- y0 0.9946107441) y5) (or (>= (- y5 0.3849473982) y0))))) 
(and (or (<= (+ x0 0.5693032137) x6) (or (<= (+ x6 0.4177817388) x0) (or (>= (- y0 0.9946107441) y6) (or (>= (- y6 0.3187779235) y0))))) 
(and (or (<= (+ x0 0.5693032137) x7) (or (<= (+ x7 0.0766915345) x0) (or (>= (- y0 0.9946107441) y7) (or (>= (- y7 0.3159747777) y0))))) 
(and (or (<= (+ x0 0.5693032137) x8) (or (<= (+ x8 0.7754169496) x0) (or (>= (- y0 0.9946107441) y8) (or (>= (- y8 0.3159323217) y0))))) 
(and (or (<= (+ x0 0.5693032137) x9) (or (<= (+ x9 0.4636189725) x0) (or (>= (- y0 0.9946107441) y9) (or (>= (- y9 0.1537072171) y0))))) 
(and (or (<= (+ x0 0.5693032137) x10) (or (<= (+ x10 0.8928896761) x0) (or (>= (- y0 0.9946107441) y10) (or (>= (- y10 0.0948221092) y0))))) 
(and (or (<= (+ x0 0.5693032137) x11) (or (<= (+ x11 0.2287630152) x0) (or (>= (- y0 0.9946107441) y11) (or (>= (- y11 0.0920997534) y0))))) 
(and (or (<= (+ x1 0.4375984291) x2) (or (<= (+ x2 0.3806448528) x1) (or (>= (- y1 0.5691318403) y2) (or (>= (- y2 0.5475063266) y1))))) 
(and (or (<= (+ x1 0.4375984291) x3) (or (<= (+ x3 0.8079232706) x1) (or (>= (- y1 0.5691318403) y3) (or (>= (- y3 0.5387788581) y1))))) 
(and (or (<= (+ x1 0.4375984291) x4) (or (<= (+ x4 0.3987046214) x1) (or (>= (- y1 0.5691318403) y4) (or (>= (- y4 0.5340624257) y1))))) 
(and (or (<= (+ x1 0.4375984291) x5) (or (<= (+ x5 0.8004112936) x1) (or (>= (- y1 0.5691318403) y5) (or (>= (- y5 0.3849473982) y1))))) 
(and (or (<= (+ x1 0.4375984291) x6) (or (<= (+ x6 0.4177817388) x1) (or (>= (- y1 0.5691318403) y6) (or (>= (- y6 0.3187779235) y1))))) 
(and (or (<= (+ x1 0.4375984291) x7) (or (<= (+ x7 0.0766915345) x1) (or (>= (- y1 0.5691318403) y7) (or (>= (- y7 0.3159747777) y1))))) 
(and (or (<= (+ x1 0.4375984291) x8) (or (<= (+ x8 0.7754169496) x1) (or (>= (- y1 0.5691318403) y8) (or (>= (- y8 0.3159323217) y1))))) 
(and (or (<= (+ x1 0.4375984291) x9) (or (<= (+ x9 0.4636189725) x1) (or (>= (- y1 0.5691318403) y9) (or (>= (- y9 0.1537072171) y1))))) 
(and (or (<= (+ x1 0.4375984291) x10) (or (<= (+ x10 0.8928896761) x1) (or (>= (- y1 0.5691318403) y10) (or (>= (- y10 0.0948221092) y1))))) 
(and (or (<= (+ x1 0.4375984291) x11) (or (<= (+ x11 0.2287630152) x1) (or (>= (- y1 0.5691318403) y11) (or (>= (- y11 0.0920997534) y1))))) 
(and (or (<= (+ x2 0.3806448528) x3) (or (<= (+ x3 0.8079232706) x2) (or (>= (- y2 0.5475063266) y3) (or (>= (- y3 0.5387788581) y2))))) 
(and (or (<= (+ x2 0.3806448528) x4) (or (<= (+ x4 0.3987046214) x2) (or (>= (- y2 0.5475063266) y4) (or (>= (- y4 0.5340624257) y2))))) 
(and (or (<= (+ x2 0.3806448528) x5) (or (<= (+ x5 0.8004112936) x2) (or (>= (- y2 0.5475063266) y5) (or (>= (- y5 0.3849473982) y2))))) 
(and (or (<= (+ x2 0.3806448528) x6) (or (<= (+ x6 0.4177817388) x2) (or (>= (- y2 0.5475063266) y6) (or (>= (- y6 0.3187779235) y2))))) 
(and (or (<= (+ x2 0.3806448528) x7) (or (<= (+ x7 0.0766915345) x2) (or (>= (- y2 0.5475063266) y7) (or (>= (- y7 0.3159747777) y2))))) 
(and (or (<= (+ x2 0.3806448528) x8) (or (<= (+ x8 0.7754169496) x2) (or (>= (- y2 0.5475063266) y8) (or (>= (- y8 0.3159323217) y2))))) 
(and (or (<= (+ x2 0.3806448528) x9) (or (<= (+ x9 0.4636189725) x2) (or (>= (- y2 0.5475063266) y9) (or (>= (- y9 0.1537072171) y2))))) 
(and (or (<= (+ x2 0.3806448528) x10) (or (<= (+ x10 0.8928896761) x2) (or (>= (- y2 0.5475063266) y10) (or (>= (- y10 0.0948221092) y2))))) 
(and (or (<= (+ x2 0.3806448528) x11) (or (<= (+ x11 0.2287630152) x2) (or (>= (- y2 0.5475063266) y11) (or (>= (- y11 0.0920997534) y2))))) 
(and (or (<= (+ x3 0.8079232706) x4) (or (<= (+ x4 0.3987046214) x3) (or (>= (- y3 0.5387788581) y4) (or (>= (- y4 0.5340624257) y3))))) 
(and (or (<= (+ x3 0.8079232706) x5) (or (<= (+ x5 0.8004112936) x3) (or (>= (- y3 0.5387788581) y5) (or (>= (- y5 0.3849473982) y3))))) 
(and (or (<= (+ x3 0.8079232706) x6) (or (<= (+ x6 0.4177817388) x3) (or (>= (- y3 0.5387788581) y6) (or (>= (- y6 0.3187779235) y3))))) 
(and (or (<= (+ x3 0.8079232706) x7) (or (<= (+ x7 0.0766915345) x3) (or (>= (- y3 0.5387788581) y7) (or (>= (- y7 0.3159747777) y3))))) 
(and (or (<= (+ x3 0.8079232706) x8) (or (<= (+ x8 0.7754169496) x3) (or (>= (- y3 0.5387788581) y8) (or (>= (- y8 0.3159323217) y3))))) 
(and (or (<= (+ x3 0.8079232706) x9) (or (<= (+ x9 0.4636189725) x3) (or (>= (- y3 0.5387788581) y9) (or (>= (- y9 0.1537072171) y3))))) 
(and (or (<= (+ x3 0.8079232706) x10) (or (<= (+ x10 0.8928896761) x3) (or (>= (- y3 0.5387788581) y10) (or (>= (- y10 0.0948221092) y3))))) 
(and (or (<= (+ x3 0.8079232706) x11) (or (<= (+ x11 0.2287630152) x3) (or (>= (- y3 0.5387788581) y11) (or (>= (- y11 0.0920997534) y3))))) 
(and (or (<= (+ x4 0.3987046214) x5) (or (<= (+ x5 0.8004112936) x4) (or (>= (- y4 0.5340624257) y5) (or (>= (- y5 0.3849473982) y4))))) 
(and (or (<= (+ x4 0.3987046214) x6) (or (<= (+ x6 0.4177817388) x4) (or (>= (- y4 0.5340624257) y6) (or (>= (- y6 0.3187779235) y4))))) 
(and (or (<= (+ x4 0.3987046214) x7) (or (<= (+ x7 0.0766915345) x4) (or (>= (- y4 0.5340624257) y7) (or (>= (- y7 0.3159747777) y4))))) 
(and (or (<= (+ x4 0.3987046214) x8) (or (<= (+ x8 0.7754169496) x4) (or (>= (- y4 0.5340624257) y8) (or (>= (- y8 0.3159323217) y4))))) 
(and (or (<= (+ x4 0.3987046214) x9) (or (<= (+ x9 0.4636189725) x4) (or (>= (- y4 0.5340624257) y9) (or (>= (- y9 0.1537072171) y4))))) 
(and (or (<= (+ x4 0.3987046214) x10) (or (<= (+ x10 0.8928896761) x4) (or (>= (- y4 0.5340624257) y10) (or (>= (- y10 0.0948221092) y4))))) 
(and (or (<= (+ x4 0.3987046214) x11) (or (<= (+ x11 0.2287630152) x4) (or (>= (- y4 0.5340624257) y11) (or (>= (- y11 0.0920997534) y4))))) 
(and (or (<= (+ x5 0.8004112936) x6) (or (<= (+ x6 0.4177817388) x5) (or (>= (- y5 0.3849473982) y6) (or (>= (- y6 0.3187779235) y5))))) 
(and (or (<= (+ x5 0.8004112936) x7) (or (<= (+ x7 0.0766915345) x5) (or (>= (- y5 0.3849473982) y7) (or (>= (- y7 0.3159747777) y5))))) 
(and (or (<= (+ x5 0.8004112936) x8) (or (<= (+ x8 0.7754169496) x5) (or (>= (- y5 0.3849473982) y8) (or (>= (- y8 0.3159323217) y5))))) 
(and (or (<= (+ x5 0.8004112936) x9) (or (<= (+ x9 0.4636189725) x5) (or (>= (- y5 0.3849473982) y9) (or (>= (- y9 0.1537072171) y5))))) 
(and (or (<= (+ x5 0.8004112936) x10) (or (<= (+ x10 0.8928896761) x5) (or (>= (- y5 0.3849473982) y10) (or (>= (- y10 0.0948221092) y5))))) 
(and (or (<= (+ x5 0.8004112936) x11) (or (<= (+ x11 0.2287630152) x5) (or (>= (- y5 0.3849473982) y11) (or (>= (- y11 0.0920997534) y5))))) 
(and (or (<= (+ x6 0.4177817388) x7) (or (<= (+ x7 0.0766915345) x6) (or (>= (- y6 0.3187779235) y7) (or (>= (- y7 0.3159747777) y6))))) 
(and (or (<= (+ x6 0.4177817388) x8) (or (<= (+ x8 0.7754169496) x6) (or (>= (- y6 0.3187779235) y8) (or (>= (- y8 0.3159323217) y6))))) 
(and (or (<= (+ x6 0.4177817388) x9) (or (<= (+ x9 0.4636189725) x6) (or (>= (- y6 0.3187779235) y9) (or (>= (- y9 0.1537072171) y6))))) 
(and (or (<= (+ x6 0.4177817388) x10) (or (<= (+ x10 0.8928896761) x6) (or (>= (- y6 0.3187779235) y10) (or (>= (- y10 0.0948221092) y6))))) 
(and (or (<= (+ x6 0.4177817388) x11) (or (<= (+ x11 0.2287630152) x6) (or (>= (- y6 0.3187779235) y11) (or (>= (- y11 0.0920997534) y6))))) 
(and (or (<= (+ x7 0.0766915345) x8) (or (<= (+ x8 0.7754169496) x7) (or (>= (- y7 0.3159747777) y8) (or (>= (- y8 0.3159323217) y7))))) 
(and (or (<= (+ x7 0.0766915345) x9) (or (<= (+ x9 0.4636189725) x7) (or (>= (- y7 0.3159747777) y9) (or (>= (- y9 0.1537072171) y7))))) 
(and (or (<= (+ x7 0.0766915345) x10) (or (<= (+ x10 0.8928896761) x7) (or (>= (- y7 0.3159747777) y10) (or (>= (- y10 0.0948221092) y7))))) 
(and (or (<= (+ x7 0.0766915345) x11) (or (<= (+ x11 0.2287630152) x7) (or (>= (- y7 0.3159747777) y11) (or (>= (- y11 0.0920997534) y7))))) 
(and (or (<= (+ x8 0.7754169496) x9) (or (<= (+ x9 0.4636189725) x8) (or (>= (- y8 0.3159323217) y9) (or (>= (- y9 0.1537072171) y8))))) 
(and (or (<= (+ x8 0.7754169496) x10) (or (<= (+ x10 0.8928896761) x8) (or (>= (- y8 0.3159323217) y10) (or (>= (- y10 0.0948221092) y8))))) 
(and (or (<= (+ x8 0.7754169496) x11) (or (<= (+ x11 0.2287630152) x8) (or (>= (- y8 0.3159323217) y11) (or (>= (- y11 0.0920997534) y8))))) 
(and (or (<= (+ x9 0.4636189725) x10) (or (<= (+ x10 0.8928896761) x9) (or (>= (- y9 0.1537072171) y10) (or (>= (- y10 0.0948221092) y9))))) 
(and (or (<= (+ x9 0.4636189725) x11) (or (<= (+ x11 0.2287630152) x9) (or (>= (- y9 0.1537072171) y11) (or (>= (- y11 0.0920997534) y9))))) 
(and (or (<= (+ x10 0.8928896761) x11) (or (<= (+ x11 0.2287630152) x10) (or (>= (- y10 0.0948221092) y11) (or (>= (- y11 0.0920997534) y10))))) )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)