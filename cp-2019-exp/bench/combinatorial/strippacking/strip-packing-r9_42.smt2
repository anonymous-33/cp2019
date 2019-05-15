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
(and (<= (+ x0 0.3605732015) z) 
(and (<= 0.9749892448 y0) 
(and (<= y0 1.5) 
(and (<= x0 (- 3.524465904 0.3605732015)) 
(and (>= x0 0) 
(and (<= (+ x1 0.5780781803) z) 
(and (<= 0.9702027806 y1) 
(and (<= y1 1.5) 
(and (<= x1 (- 3.524465904 0.5780781803)) 
(and (>= x1 0) 
(and (<= (+ x2 0.1078204323) z) 
(and (<= 0.9130611674 y2) 
(and (<= y2 1.5) 
(and (<= x2 (- 3.524465904 0.1078204323)) 
(and (>= x2 0) 
(and (<= (+ x3 0.9734640303) z) 
(and (<= 0.8011623493 y3) 
(and (<= y3 1.5) 
(and (<= x3 (- 3.524465904 0.9734640303)) 
(and (>= x3 0) 
(and (<= (+ x4 0.7249706816) z) 
(and (<= 0.7767892619 y4) 
(and (<= y4 1.5) 
(and (<= x4 (- 3.524465904 0.7249706816)) 
(and (>= x4 0) 
(and (<= (+ x5 0.7813620252) z) 
(and (<= 0.4946447119 y5) 
(and (<= y5 1.5) 
(and (<= x5 (- 3.524465904 0.7813620252)) 
(and (>= x5 0) 
(and (<= (+ x6 0.3501155622) z) 
(and (<= 0.4550585194 y6) 
(and (<= y6 1.5) 
(and (<= x6 (- 3.524465904 0.3501155622)) 
(and (>= x6 0) 
(and (<= (+ x7 0.779559378) z) 
(and (<= 0.4107343161 y7) 
(and (<= y7 1.5) 
(and (<= x7 (- 3.524465904 0.779559378)) 
(and (>= x7 0) 
(and (<= (+ x8 0.2635287858) z) 
(and (<= 0.3233005126 y8) 
(and (<= y8 1.5) 
(and (<= x8 (- 3.524465904 0.2635287858)) 
(and (>= x8 0) 
(and (<= c 3.524465904) 
(and (or (<= (+ x0 0.3605732015) x1) (or (<= (+ x1 0.5780781803) x0) (or (>= (- y0 0.9749892448) y1) (or (>= (- y1 0.9702027806) y0))))) 
(and (or (<= (+ x0 0.3605732015) x2) (or (<= (+ x2 0.1078204323) x0) (or (>= (- y0 0.9749892448) y2) (or (>= (- y2 0.9130611674) y0))))) 
(and (or (<= (+ x0 0.3605732015) x3) (or (<= (+ x3 0.9734640303) x0) (or (>= (- y0 0.9749892448) y3) (or (>= (- y3 0.8011623493) y0))))) 
(and (or (<= (+ x0 0.3605732015) x4) (or (<= (+ x4 0.7249706816) x0) (or (>= (- y0 0.9749892448) y4) (or (>= (- y4 0.7767892619) y0))))) 
(and (or (<= (+ x0 0.3605732015) x5) (or (<= (+ x5 0.7813620252) x0) (or (>= (- y0 0.9749892448) y5) (or (>= (- y5 0.4946447119) y0))))) 
(and (or (<= (+ x0 0.3605732015) x6) (or (<= (+ x6 0.3501155622) x0) (or (>= (- y0 0.9749892448) y6) (or (>= (- y6 0.4550585194) y0))))) 
(and (or (<= (+ x0 0.3605732015) x7) (or (<= (+ x7 0.779559378) x0) (or (>= (- y0 0.9749892448) y7) (or (>= (- y7 0.4107343161) y0))))) 
(and (or (<= (+ x0 0.3605732015) x8) (or (<= (+ x8 0.2635287858) x0) (or (>= (- y0 0.9749892448) y8) (or (>= (- y8 0.3233005126) y0))))) 
(and (or (<= (+ x1 0.5780781803) x2) (or (<= (+ x2 0.1078204323) x1) (or (>= (- y1 0.9702027806) y2) (or (>= (- y2 0.9130611674) y1))))) 
(and (or (<= (+ x1 0.5780781803) x3) (or (<= (+ x3 0.9734640303) x1) (or (>= (- y1 0.9702027806) y3) (or (>= (- y3 0.8011623493) y1))))) 
(and (or (<= (+ x1 0.5780781803) x4) (or (<= (+ x4 0.7249706816) x1) (or (>= (- y1 0.9702027806) y4) (or (>= (- y4 0.7767892619) y1))))) 
(and (or (<= (+ x1 0.5780781803) x5) (or (<= (+ x5 0.7813620252) x1) (or (>= (- y1 0.9702027806) y5) (or (>= (- y5 0.4946447119) y1))))) 
(and (or (<= (+ x1 0.5780781803) x6) (or (<= (+ x6 0.3501155622) x1) (or (>= (- y1 0.9702027806) y6) (or (>= (- y6 0.4550585194) y1))))) 
(and (or (<= (+ x1 0.5780781803) x7) (or (<= (+ x7 0.779559378) x1) (or (>= (- y1 0.9702027806) y7) (or (>= (- y7 0.4107343161) y1))))) 
(and (or (<= (+ x1 0.5780781803) x8) (or (<= (+ x8 0.2635287858) x1) (or (>= (- y1 0.9702027806) y8) (or (>= (- y8 0.3233005126) y1))))) 
(and (or (<= (+ x2 0.1078204323) x3) (or (<= (+ x3 0.9734640303) x2) (or (>= (- y2 0.9130611674) y3) (or (>= (- y3 0.8011623493) y2))))) 
(and (or (<= (+ x2 0.1078204323) x4) (or (<= (+ x4 0.7249706816) x2) (or (>= (- y2 0.9130611674) y4) (or (>= (- y4 0.7767892619) y2))))) 
(and (or (<= (+ x2 0.1078204323) x5) (or (<= (+ x5 0.7813620252) x2) (or (>= (- y2 0.9130611674) y5) (or (>= (- y5 0.4946447119) y2))))) 
(and (or (<= (+ x2 0.1078204323) x6) (or (<= (+ x6 0.3501155622) x2) (or (>= (- y2 0.9130611674) y6) (or (>= (- y6 0.4550585194) y2))))) 
(and (or (<= (+ x2 0.1078204323) x7) (or (<= (+ x7 0.779559378) x2) (or (>= (- y2 0.9130611674) y7) (or (>= (- y7 0.4107343161) y2))))) 
(and (or (<= (+ x2 0.1078204323) x8) (or (<= (+ x8 0.2635287858) x2) (or (>= (- y2 0.9130611674) y8) (or (>= (- y8 0.3233005126) y2))))) 
(and (or (<= (+ x3 0.9734640303) x4) (or (<= (+ x4 0.7249706816) x3) (or (>= (- y3 0.8011623493) y4) (or (>= (- y4 0.7767892619) y3))))) 
(and (or (<= (+ x3 0.9734640303) x5) (or (<= (+ x5 0.7813620252) x3) (or (>= (- y3 0.8011623493) y5) (or (>= (- y5 0.4946447119) y3))))) 
(and (or (<= (+ x3 0.9734640303) x6) (or (<= (+ x6 0.3501155622) x3) (or (>= (- y3 0.8011623493) y6) (or (>= (- y6 0.4550585194) y3))))) 
(and (or (<= (+ x3 0.9734640303) x7) (or (<= (+ x7 0.779559378) x3) (or (>= (- y3 0.8011623493) y7) (or (>= (- y7 0.4107343161) y3))))) 
(and (or (<= (+ x3 0.9734640303) x8) (or (<= (+ x8 0.2635287858) x3) (or (>= (- y3 0.8011623493) y8) (or (>= (- y8 0.3233005126) y3))))) 
(and (or (<= (+ x4 0.7249706816) x5) (or (<= (+ x5 0.7813620252) x4) (or (>= (- y4 0.7767892619) y5) (or (>= (- y5 0.4946447119) y4))))) 
(and (or (<= (+ x4 0.7249706816) x6) (or (<= (+ x6 0.3501155622) x4) (or (>= (- y4 0.7767892619) y6) (or (>= (- y6 0.4550585194) y4))))) 
(and (or (<= (+ x4 0.7249706816) x7) (or (<= (+ x7 0.779559378) x4) (or (>= (- y4 0.7767892619) y7) (or (>= (- y7 0.4107343161) y4))))) 
(and (or (<= (+ x4 0.7249706816) x8) (or (<= (+ x8 0.2635287858) x4) (or (>= (- y4 0.7767892619) y8) (or (>= (- y8 0.3233005126) y4))))) 
(and (or (<= (+ x5 0.7813620252) x6) (or (<= (+ x6 0.3501155622) x5) (or (>= (- y5 0.4946447119) y6) (or (>= (- y6 0.4550585194) y5))))) 
(and (or (<= (+ x5 0.7813620252) x7) (or (<= (+ x7 0.779559378) x5) (or (>= (- y5 0.4946447119) y7) (or (>= (- y7 0.4107343161) y5))))) 
(and (or (<= (+ x5 0.7813620252) x8) (or (<= (+ x8 0.2635287858) x5) (or (>= (- y5 0.4946447119) y8) (or (>= (- y8 0.3233005126) y5))))) 
(and (or (<= (+ x6 0.3501155622) x7) (or (<= (+ x7 0.779559378) x6) (or (>= (- y6 0.4550585194) y7) (or (>= (- y7 0.4107343161) y6))))) 
(and (or (<= (+ x6 0.3501155622) x8) (or (<= (+ x8 0.2635287858) x6) (or (>= (- y6 0.4550585194) y8) (or (>= (- y8 0.3233005126) y6))))) 
(and (or (<= (+ x7 0.779559378) x8) (or (<= (+ x8 0.2635287858) x7) (or (>= (- y7 0.4107343161) y8) (or (>= (- y8 0.3233005126) y7))))) ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)