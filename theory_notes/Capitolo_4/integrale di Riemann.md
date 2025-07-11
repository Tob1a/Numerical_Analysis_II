È tutta quella area che viene compresa dalla funzione tra a e b chiamata trapezzoide con la funzione >=0




n quanti punti scelgo

E[f] = errore di discretizzazione che commetto


teorema di weiestrass ci dice che la distanza tra f e p è < epsilon

M= grado di quadratura.
se usassi uno con un grado M+1 allora non funziona
errore globale= la somma di tutti gli errori che ha il mio sistema (aritmetica finita, arrotondamento, troncamento,... )

Devo tenere limitato il mio sum^n{i=1}|a_i|
perciò devo trovare formule di quadratura con quelle 2 proprietà per evitare che diventi instabile

L_i(x) è il polinomio base di Lagrange


b_i non so chi sono, ma so che fino alla x_n funziona
slide 20 sintesi

Metodo coefficienti indeterminati

primo di grado 0
poi di grado 1
...
poi di grado n


Formula Simpson
nel caso in cui io abbia 3 punti (nodi) di approssimazione 
a0,
a1
a2

Vale per i polinomi di grado 2 e 3
Dai polinomi 4 in su dipende da phi^4