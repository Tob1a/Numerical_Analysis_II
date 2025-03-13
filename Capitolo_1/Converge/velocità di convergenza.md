La velocità di convergenza indica quanto velocemente il mio sistema approssimato converge alla soluzione
la velocità non è uguale all'[[clone/Capitolo_1/Converge/ordine di convergenza|ordine di convergenza]] 
Esistono più velocità
1) **Convergenza Lineare**
	$$
	\begin{matrix}
		\text{una successione }x_n \text{ converge linearmente a }x^*\text{ se esiste una costante }k\in(0,1) \text{ tale che:}\\
		\lim_{n\to \inf}{\frac{|x_{n+1}-x^*|}{|x_n-x^*|}=k}
	\end{matrix}
	$$
	L'errore si riduce di un fattore costante k a ogni iterazione.
	#Es. metodo del punto fisso x=cos(x)
	$$x_{n+1}=cos(x_n)$$
	Con k≈0.73k≈0.73, servono circa 10 iterazioni per guadagnare 1 cifra decimale.
2) **Convergenza Quadratica**
	**Definizione**:  
	La convergenza è quadratica se l'errore è proporzionale al **quadrato** dell'errore precedente:
	$$
		\lim_{n\to \inf}{\frac{|x_{n+1}-x^*|}{|x_n-x^*|}=C}  \text{ dove     (C>0)}
	$$
	**Velocità**: Il numero di cifre corrette **raddoppia** a ogni passo
	#Es. metodo [[clone/Capitolo_1/Newton-Raphson]] per
	$$
	\begin{matrix}
		\text{per }f(x)=0\\
		x_{n+1}=x_n-\frac{f(x_n)}{f'(x_n)}\\
		\text{se }f'(x^*)\ne 0 \text{ la convegenza è quadratica}\\
	\end{matrix}
	$$

3) **Convergenza Geometrica (o Esponenziale)**
		L'errore decresce come una **serie geometrica**:
		$$
			|x_n-x^*|\leq C*r^n \text{ con } r\in (0,1)
		$$
		**Sinonimi**: A volte chiamata "convergenza esponenziale"
	#Esempio 
	$$
	\begin{matrix}
		\text{Iterazioni per }x_{n+1}=\frac{1}{2}x^n: \\
		x_n=(\frac{1}{2})^n x^0 \implies\text{Errore }\alpha(\frac{1}{2})^n
	\end{matrix}
	$$
Dunque tornando a noi un esempio di tabella
$$
\begin{array}{c|cc}
n & x_n & |x_n - x^*| \\
\hline
0 & 2.0 & 0.2679 \\
1 & 1.75 & 0.0179 \\
2 & 1.7321 & 0.0001 \\
\end{array}
$$
Riassunto:
$$
\begin{array}{|c|c|}
\hline
\textbf{Lineare} & e_{n+1} \leq k \cdot e_n \quad (0 < k < 1) \\
\hline
\textbf{Quadratica} & e_{n+1} \leq C \cdot e_n^2 \quad (C > 0) \\
\hline
\textbf{Geometrica} & e_n \leq C \cdot r^n \quad (0 < r < 1) \\
\hline
\end{array}
$$
