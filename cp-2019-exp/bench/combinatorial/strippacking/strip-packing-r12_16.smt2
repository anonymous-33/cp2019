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
(and (<= (+ x0 0.6649366493) z) 
(and (<= 0.8580494825 y0) 
(and (<= y0 1.0) 
(and (<= x0 (- 4.4788005171 0.6649366493)) 
(and (>= x0 0) 
(and (<= (+ x1 0.3732512466) z) 
(and (<= 0.703774348 y1) 
(and (<= y1 1.0) 
(and (<= x1 (- 4.4788005171 0.3732512466)) 
(and (>= x1 0) 
(and (<= (+ x2 0.9898716264) z) 
(and (<= 0.6979562952 y2) 
(and (<= y2 1.0) 
(and (<= x2 (- 4.4788005171 0.9898716264)) 
(and (>= x2 0) 
(and (<= (+ x3 0.25658575) z) 
(and (<= 0.689891748 y3) 
(and (<= y3 1.0) 
(and (<= x3 (- 4.4788005171 0.25658575)) 
(and (>= x3 0) 
(and (<= (+ x4 0.5830473734) z) 
(and (<= 0.5532407462 y4) 
(and (<= y4 1.0) 
(and (<= x4 (- 4.4788005171 0.5830473734)) 
(and (>= x4 0) 
(and (<= (+ x5 0.9726306463) z) 
(and (<= 0.5432116717 y5) 
(and (<= y5 1.0) 
(and (<= x5 (- 4.4788005171 0.9726306463)) 
(and (>= x5 0) 
(and (<= (+ x6 0.6384772251) z) 
(and (<= 0.5195193344 y6) 
(and (<= y6 1.0) 
(and (<= x6 (- 4.4788005171 0.6384772251)) 
(and (>= x6 0) 
(and (<= (+ x7 0.7411446181) z) 
(and (<= 0.3650040759 y7) 
(and (<= y7 1.0) 
(and (<= x7 (- 4.4788005171 0.7411446181)) 
(and (>= x7 0) 
(and (<= (+ x8 0.5904842701) z) 
(and (<= 0.3422941736 y8) 
(and (<= y8 1.0) 
(and (<= x8 (- 4.4788005171 0.5904842701)) 
(and (>= x8 0) 
(and (<= (+ x9 0.1923631757) z) 
(and (<= 0.3325810311 y9) 
(and (<= y9 1.0) 
(and (<= x9 (- 4.4788005171 0.1923631757)) 
(and (>= x9 0) 
(and (<= (+ x10 0.746493995) z) 
(and (<= 0.1064592961 y10) 
(and (<= y10 1.0) 
(and (<= x10 (- 4.4788005171 0.746493995)) 
(and (>= x10 0) 
(and (<= (+ x11 0.2107580064) z) 
(and (<= 0.0437949627 y11) 
(and (<= y11 1.0) 
(and (<= x11 (- 4.4788005171 0.2107580064)) 
(and (>= x11 0) 
(and (<= c 4.4788005171) 
(and (or (<= (+ x0 0.6649366493) x1) (or (<= (+ x1 0.3732512466) x0) (or (>= (- y0 0.8580494825) y1) (or (>= (- y1 0.703774348) y0))))) 
(and (or (<= (+ x0 0.6649366493) x2) (or (<= (+ x2 0.9898716264) x0) (or (>= (- y0 0.8580494825) y2) (or (>= (- y2 0.6979562952) y0))))) 
(and (or (<= (+ x0 0.6649366493) x3) (or (<= (+ x3 0.25658575) x0) (or (>= (- y0 0.8580494825) y3) (or (>= (- y3 0.689891748) y0))))) 
(and (or (<= (+ x0 0.6649366493) x4) (or (<= (+ x4 0.5830473734) x0) (or (>= (- y0 0.8580494825) y4) (or (>= (- y4 0.5532407462) y0))))) 
(and (or (<= (+ x0 0.6649366493) x5) (or (<= (+ x5 0.9726306463) x0) (or (>= (- y0 0.8580494825) y5) (or (>= (- y5 0.5432116717) y0))))) 
(and (or (<= (+ x0 0.6649366493) x6) (or (<= (+ x6 0.6384772251) x0) (or (>= (- y0 0.8580494825) y6) (or (>= (- y6 0.5195193344) y0))))) 
(and (or (<= (+ x0 0.6649366493) x7) (or (<= (+ x7 0.7411446181) x0) (or (>= (- y0 0.8580494825) y7) (or (>= (- y7 0.3650040759) y0))))) 
(and (or (<= (+ x0 0.6649366493) x8) (or (<= (+ x8 0.5904842701) x0) (or (>= (- y0 0.8580494825) y8) (or (>= (- y8 0.3422941736) y0))))) 
(and (or (<= (+ x0 0.6649366493) x9) (or (<= (+ x9 0.1923631757) x0) (or (>= (- y0 0.8580494825) y9) (or (>= (- y9 0.3325810311) y0))))) 
(and (or (<= (+ x0 0.6649366493) x10) (or (<= (+ x10 0.746493995) x0) (or (>= (- y0 0.8580494825) y10) (or (>= (- y10 0.1064592961) y0))))) 
(and (or (<= (+ x0 0.6649366493) x11) (or (<= (+ x11 0.2107580064) x0) (or (>= (- y0 0.8580494825) y11) (or (>= (- y11 0.0437949627) y0))))) 
(and (or (<= (+ x1 0.3732512466) x2) (or (<= (+ x2 0.9898716264) x1) (or (>= (- y1 0.703774348) y2) (or (>= (- y2 0.6979562952) y1))))) 
(and (or (<= (+ x1 0.3732512466) x3) (or (<= (+ x3 0.25658575) x1) (or (>= (- y1 0.703774348) y3) (or (>= (- y3 0.689891748) y1))))) 
(and (or (<= (+ x1 0.3732512466) x4) (or (<= (+ x4 0.5830473734) x1) (or (>= (- y1 0.703774348) y4) (or (>= (- y4 0.5532407462) y1))))) 
(and (or (<= (+ x1 0.3732512466) x5) (or (<= (+ x5 0.9726306463) x1) (or (>= (- y1 0.703774348) y5) (or (>= (- y5 0.5432116717) y1))))) 
(and (or (<= (+ x1 0.3732512466) x6) (or (<= (+ x6 0.6384772251) x1) (or (>= (- y1 0.703774348) y6) (or (>= (- y6 0.5195193344) y1))))) 
(and (or (<= (+ x1 0.3732512466) x7) (or (<= (+ x7 0.7411446181) x1) (or (>= (- y1 0.703774348) y7) (or (>= (- y7 0.3650040759) y1))))) 
(and (or (<= (+ x1 0.3732512466) x8) (or (<= (+ x8 0.5904842701) x1) (or (>= (- y1 0.703774348) y8) (or (>= (- y8 0.3422941736) y1))))) 
(and (or (<= (+ x1 0.3732512466) x9) (or (<= (+ x9 0.1923631757) x1) (or (>= (- y1 0.703774348) y9) (or (>= (- y9 0.3325810311) y1))))) 
(and (or (<= (+ x1 0.3732512466) x10) (or (<= (+ x10 0.746493995) x1) (or (>= (- y1 0.703774348) y10) (or (>= (- y10 0.1064592961) y1))))) 
(and (or (<= (+ x1 0.3732512466) x11) (or (<= (+ x11 0.2107580064) x1) (or (>= (- y1 0.703774348) y11) (or (>= (- y11 0.0437949627) y1))))) 
(and (or (<= (+ x2 0.9898716264) x3) (or (<= (+ x3 0.25658575) x2) (or (>= (- y2 0.6979562952) y3) (or (>= (- y3 0.689891748) y2))))) 
(and (or (<= (+ x2 0.9898716264) x4) (or (<= (+ x4 0.5830473734) x2) (or (>= (- y2 0.6979562952) y4) (or (>= (- y4 0.5532407462) y2))))) 
(and (or (<= (+ x2 0.9898716264) x5) (or (<= (+ x5 0.9726306463) x2) (or (>= (- y2 0.6979562952) y5) (or (>= (- y5 0.5432116717) y2))))) 
(and (or (<= (+ x2 0.9898716264) x6) (or (<= (+ x6 0.6384772251) x2) (or (>= (- y2 0.6979562952) y6) (or (>= (- y6 0.5195193344) y2))))) 
(and (or (<= (+ x2 0.9898716264) x7) (or (<= (+ x7 0.7411446181) x2) (or (>= (- y2 0.6979562952) y7) (or (>= (- y7 0.3650040759) y2))))) 
(and (or (<= (+ x2 0.9898716264) x8) (or (<= (+ x8 0.5904842701) x2) (or (>= (- y2 0.6979562952) y8) (or (>= (- y8 0.3422941736) y2))))) 
(and (or (<= (+ x2 0.9898716264) x9) (or (<= (+ x9 0.1923631757) x2) (or (>= (- y2 0.6979562952) y9) (or (>= (- y9 0.3325810311) y2))))) 
(and (or (<= (+ x2 0.9898716264) x10) (or (<= (+ x10 0.746493995) x2) (or (>= (- y2 0.6979562952) y10) (or (>= (- y10 0.1064592961) y2))))) 
(and (or (<= (+ x2 0.9898716264) x11) (or (<= (+ x11 0.2107580064) x2) (or (>= (- y2 0.6979562952) y11) (or (>= (- y11 0.0437949627) y2))))) 
(and (or (<= (+ x3 0.25658575) x4) (or (<= (+ x4 0.5830473734) x3) (or (>= (- y3 0.689891748) y4) (or (>= (- y4 0.5532407462) y3))))) 
(and (or (<= (+ x3 0.25658575) x5) (or (<= (+ x5 0.9726306463) x3) (or (>= (- y3 0.689891748) y5) (or (>= (- y5 0.5432116717) y3))))) 
(and (or (<= (+ x3 0.25658575) x6) (or (<= (+ x6 0.6384772251) x3) (or (>= (- y3 0.689891748) y6) (or (>= (- y6 0.5195193344) y3))))) 
(and (or (<= (+ x3 0.25658575) x7) (or (<= (+ x7 0.7411446181) x3) (or (>= (- y3 0.689891748) y7) (or (>= (- y7 0.3650040759) y3))))) 
(and (or (<= (+ x3 0.25658575) x8) (or (<= (+ x8 0.5904842701) x3) (or (>= (- y3 0.689891748) y8) (or (>= (- y8 0.3422941736) y3))))) 
(and (or (<= (+ x3 0.25658575) x9) (or (<= (+ x9 0.1923631757) x3) (or (>= (- y3 0.689891748) y9) (or (>= (- y9 0.3325810311) y3))))) 
(and (or (<= (+ x3 0.25658575) x10) (or (<= (+ x10 0.746493995) x3) (or (>= (- y3 0.689891748) y10) (or (>= (- y10 0.1064592961) y3))))) 
(and (or (<= (+ x3 0.25658575) x11) (or (<= (+ x11 0.2107580064) x3) (or (>= (- y3 0.689891748) y11) (or (>= (- y11 0.0437949627) y3))))) 
(and (or (<= (+ x4 0.5830473734) x5) (or (<= (+ x5 0.9726306463) x4) (or (>= (- y4 0.5532407462) y5) (or (>= (- y5 0.5432116717) y4))))) 
(and (or (<= (+ x4 0.5830473734) x6) (or (<= (+ x6 0.6384772251) x4) (or (>= (- y4 0.5532407462) y6) (or (>= (- y6 0.5195193344) y4))))) 
(and (or (<= (+ x4 0.5830473734) x7) (or (<= (+ x7 0.7411446181) x4) (or (>= (- y4 0.5532407462) y7) (or (>= (- y7 0.3650040759) y4))))) 
(and (or (<= (+ x4 0.5830473734) x8) (or (<= (+ x8 0.5904842701) x4) (or (>= (- y4 0.5532407462) y8) (or (>= (- y8 0.3422941736) y4))))) 
(and (or (<= (+ x4 0.5830473734) x9) (or (<= (+ x9 0.1923631757) x4) (or (>= (- y4 0.5532407462) y9) (or (>= (- y9 0.3325810311) y4))))) 
(and (or (<= (+ x4 0.5830473734) x10) (or (<= (+ x10 0.746493995) x4) (or (>= (- y4 0.5532407462) y10) (or (>= (- y10 0.1064592961) y4))))) 
(and (or (<= (+ x4 0.5830473734) x11) (or (<= (+ x11 0.2107580064) x4) (or (>= (- y4 0.5532407462) y11) (or (>= (- y11 0.0437949627) y4))))) 
(and (or (<= (+ x5 0.9726306463) x6) (or (<= (+ x6 0.6384772251) x5) (or (>= (- y5 0.5432116717) y6) (or (>= (- y6 0.5195193344) y5))))) 
(and (or (<= (+ x5 0.9726306463) x7) (or (<= (+ x7 0.7411446181) x5) (or (>= (- y5 0.5432116717) y7) (or (>= (- y7 0.3650040759) y5))))) 
(and (or (<= (+ x5 0.9726306463) x8) (or (<= (+ x8 0.5904842701) x5) (or (>= (- y5 0.5432116717) y8) (or (>= (- y8 0.3422941736) y5))))) 
(and (or (<= (+ x5 0.9726306463) x9) (or (<= (+ x9 0.1923631757) x5) (or (>= (- y5 0.5432116717) y9) (or (>= (- y9 0.3325810311) y5))))) 
(and (or (<= (+ x5 0.9726306463) x10) (or (<= (+ x10 0.746493995) x5) (or (>= (- y5 0.5432116717) y10) (or (>= (- y10 0.1064592961) y5))))) 
(and (or (<= (+ x5 0.9726306463) x11) (or (<= (+ x11 0.2107580064) x5) (or (>= (- y5 0.5432116717) y11) (or (>= (- y11 0.0437949627) y5))))) 
(and (or (<= (+ x6 0.6384772251) x7) (or (<= (+ x7 0.7411446181) x6) (or (>= (- y6 0.5195193344) y7) (or (>= (- y7 0.3650040759) y6))))) 
(and (or (<= (+ x6 0.6384772251) x8) (or (<= (+ x8 0.5904842701) x6) (or (>= (- y6 0.5195193344) y8) (or (>= (- y8 0.3422941736) y6))))) 
(and (or (<= (+ x6 0.6384772251) x9) (or (<= (+ x9 0.1923631757) x6) (or (>= (- y6 0.5195193344) y9) (or (>= (- y9 0.3325810311) y6))))) 
(and (or (<= (+ x6 0.6384772251) x10) (or (<= (+ x10 0.746493995) x6) (or (>= (- y6 0.5195193344) y10) (or (>= (- y10 0.1064592961) y6))))) 
(and (or (<= (+ x6 0.6384772251) x11) (or (<= (+ x11 0.2107580064) x6) (or (>= (- y6 0.5195193344) y11) (or (>= (- y11 0.0437949627) y6))))) 
(and (or (<= (+ x7 0.7411446181) x8) (or (<= (+ x8 0.5904842701) x7) (or (>= (- y7 0.3650040759) y8) (or (>= (- y8 0.3422941736) y7))))) 
(and (or (<= (+ x7 0.7411446181) x9) (or (<= (+ x9 0.1923631757) x7) (or (>= (- y7 0.3650040759) y9) (or (>= (- y9 0.3325810311) y7))))) 
(and (or (<= (+ x7 0.7411446181) x10) (or (<= (+ x10 0.746493995) x7) (or (>= (- y7 0.3650040759) y10) (or (>= (- y10 0.1064592961) y7))))) 
(and (or (<= (+ x7 0.7411446181) x11) (or (<= (+ x11 0.2107580064) x7) (or (>= (- y7 0.3650040759) y11) (or (>= (- y11 0.0437949627) y7))))) 
(and (or (<= (+ x8 0.5904842701) x9) (or (<= (+ x9 0.1923631757) x8) (or (>= (- y8 0.3422941736) y9) (or (>= (- y9 0.3325810311) y8))))) 
(and (or (<= (+ x8 0.5904842701) x10) (or (<= (+ x10 0.746493995) x8) (or (>= (- y8 0.3422941736) y10) (or (>= (- y10 0.1064592961) y8))))) 
(and (or (<= (+ x8 0.5904842701) x11) (or (<= (+ x11 0.2107580064) x8) (or (>= (- y8 0.3422941736) y11) (or (>= (- y11 0.0437949627) y8))))) 
(and (or (<= (+ x9 0.1923631757) x10) (or (<= (+ x10 0.746493995) x9) (or (>= (- y9 0.3325810311) y10) (or (>= (- y10 0.1064592961) y9))))) 
(and (or (<= (+ x9 0.1923631757) x11) (or (<= (+ x11 0.2107580064) x9) (or (>= (- y9 0.3325810311) y11) (or (>= (- y11 0.0437949627) y9))))) 
(and (or (<= (+ x10 0.746493995) x11) (or (<= (+ x11 0.2107580064) x10) (or (>= (- y10 0.1064592961) y11) (or (>= (- y11 0.0437949627) y10))))) )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(minimize c )
(check-sat)
(get-objectives)
(exit)