Si applica agli spazi metrici completi e garantisce l'esistenza e unicità di un **punto fisso** per una particolare classe di funzioni dette **contrazioni**.
Vattelo a becare sulle slide, ma salta la dimostrazione
$$\rho \text{ è il raggio di un insieme X o S}$$
Sia g(x) una [[funzione di contrazione]] in un opportuno dominio che contiene
 $$
[[	\overline{S(x^{(0)},p)}]]
$$
_(La formula vuol dire un insieme S inteso come una palla con centro nel punto $x^0$
e raggio $\rho$ denotato con la chiusura (la barra sopra), quindi $\leq \rho$)_

per cui vale anche la seguente formula
$$ 
	||g(x^{(0)})-x^{(0)}||\leq(1-L)\rho
	$$
allora si verificano le seguenti condizioni
$$
	\begin{matrix}
		1) & \quad & x^k \in \overline{S(x^{(0)}, p)} \\
		2) & \quad & \text{La successione degli } x^k \text{ converge, per } k \to \infty, \text{ all'unico punto } x^* \text{ di } g(x) \\
		3) & \quad & \text{Abbiamo una stima dell'errore} \\
		4) & \quad & \text{La velocità di convergenza è geometrica, ovvero } R\text{-lineare}
	\end{matrix}
$$

_Per vedere la dimostrazione vatti a vedere le slide 15-17_
Tuttavia in aritmetica finita non funziona in questo modo. Ho un vettore di errori che mi trascino durante l'aritmetica finita. Per un k che tende a infinito il mio sistema non [[clone/Capitolo_1/Converge/converge]] per vai degli errori che mi trascino, _consiglio di guardare slide 19_


Trovare la formula però non è sempre banale e certe volte mi devo far aiutare dallo [[matrice jacobiana]] della g(x) con il [[teorema convergenza locale]]
Una condizione sufficiente a garantire la contrattività (in norma infinito) di g(x) è
che per ogni x ∈ X valga che:
$$
	\| \frac{\partial g_i(x)}{\partial x_j} \| \leq \frac{L}{n} 
$$
Dove $n$ è il numero di incognite
Quindi abbiamo il seguente Teorema:
La contrattività di $g$ in $S(x^*,ρ)$ è garantita dalla più debole condizione:
$$
	\|G(x)\|_∞ ≤ L \text{ per }x ∈ S(x^*, ρ)
$$
Ricordiamo che $0\leq L <1$
La cui [[Norma]]  è infinita

#Esempio 
$$
f(x,y)=
\begin{cases}
	x^2+y^2-4=0\\
	xy-1=0
\end{cases}
$$
Da qui ricavo $g(x,y)$
$$
	g(x,y)=x-\phi(x,y)*f(x,y)
$$
Nella g(x) devo cercare di isolare la mia incognita e mi aiuto con $\phi(x,y)$ $$
	g(x,y)=
	\cases{
	\sqrt{4-y^2}=x\\
	\frac{1}{x}=y
	}
$$
$$
\phi(x,y)=\begin{bmatrix}
	&0\\
0&0
\end{bmatrix}
$$
Per aiutarci a trovare L dobbiamo calcolare la Jacobiana di g quindi
$$
	J_g(x,y)=\begin{bmatrix}
0 & \frac{-y}{\sqrt{4-y^2}}\\
-\frac{1}{x^2}&0
\end{bmatrix}
$$
Ora dobbiamo calcolarmi la [[norma]] infinita
$$
\|J_g(x,y)\|= \max \left({\frac{|y|}{|\sqrt{(y^2-4)}|},\frac{1}{|x|^2},0,0}\right)
$$

Ok, ora io voglio che  $0\leq\|J_g(x,y)\| <1$.  
Quindi devo scegliere 2 termini minori di 1 . Può funzionare per esempio:
