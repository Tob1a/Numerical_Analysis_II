Si applica agli spazi metrici completi e garantisce l'esistenza e unicità di un **punto fisso** per una particolare classe di funzioni dette **contrazioni**.
Vattelo a becare sulle slide, ma salta la dimostrazione
$$\rho \text{ è il raggio di un insieme X o S}$$
Sia g(x) una [[funzione di contrazione]] in un opportuno dominio che contiene
 $$
[[	\overline{S(x^{(0)},p)}]]
$$
_(La formula vuol dire un insieme S inteso come una palla con centro nel punto x^0
e raggio \rho denotato con la chiusura (la barra sopra), quindi minore/uguale al raggio rho)_

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


