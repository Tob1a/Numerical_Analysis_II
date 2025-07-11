Si assuma che il punto fisso esista, come in tutti i teoremi di convergenza

Il teorema di convergenza locale indica che lo [[matrice jacobiana|jacobiano]] è nullo cioè G(x^*)=0 e se sue derivate seconde e prime sono continue e limitate allora la [[velocità di convergenza]] è quadratica 

# Teorema di Convergenza del Metodo del Punto Fisso in Più Variabili 🔄

## **Ipotesi** 📜##
1. Sia $(\mathbf{x}^*)$  un [[punto fisso di una funzione non lineare|punto fisso di una funzione]] $\mathbf{g}(\mathbf{x})$, cioè:
   $$
   \mathbf{g}(\mathbf{x}^*) = \mathbf{x}^*.$$
2. $g(x^2)$ è **[[funzione continua|continua]]** con derivate parziali prime continue in un intorno:
   $$
   S(\mathbf{x}^*, \rho) = \{ \mathbf{x} \in \mathbb{R}^n : \|\mathbf{x} - \mathbf{x}^*\|_\infty \leq \rho \}.
   $$
3. La norma infinito della **[[matrice jacobiana]]** $$G(\mathbf{x}) \text{ dove } G_{ij}(\mathbf{x}) = \frac{\partial g_i}{\partial x_j}(\mathbf{x})$$ soddisfa:
   $$
   \|G(\mathbf{x})\|_\infty = \max_{1 \leq i \leq n} \sum_{j=1}^n \left| \frac{\partial g_i}{\partial x_j}(\mathbf{x}) \right| \leq L < 1 \quad \forall \mathbf{x} \in S(\mathbf{x}^*, \rho),
   $$
   con $(0 \leq L < 1)$.

---

## **Tesi** ✅
Per ogni $\mathbf{x}^{(0)} \in S(\mathbf{x}^*, \rho)$:
1. **Invarianza** (il metodo è ben definito):  
   $$
   \mathbf{x}^{(k)} \in S(\mathbf{x}^*, \rho) \quad \forall k \geq 0.
   $$
2. **Convergenza** all'unico punto fisso:  
   $$
   \lim_{k \to \infty} \mathbf{x}^{(k)} = \mathbf{x}^*.
   $$
3. **Stima dell'errore**:  
   $$
   \|\mathbf{x}^{(k)} - \mathbf{x}^*\|_\infty \leq \frac{L^k}{1 - L} \|\mathbf{x}^{(1)} - \mathbf{x}^{(0)}\|_\infty.
   $$

---

## **Dimostrazione (Schema)** 📐

<summary>Clicca per espandere</summary>

1. **Contrazione**: La condizione $(|G(\mathbf{x})\|_\infty \leq L < )$ implica che $(\mathbf{g})$ è una **contrazione** in $(S(\mathbf{x}^*, \rho))$.  
2. **Teorema del punto fisso di [[Banach-Cacciopoli]]**: Garantisce convergenza all'unico punto fisso $(\mathbf{x}^*\ in \\(S(\mathbf{x}^*, \rho))$.  
3. **Stima dell'errore**: Si deriva iterativamente usando la disuguaglianza:
   $$
   \|\mathbf{x}^{(k+1)} - \mathbf{x}^*\|_\infty \leq L \|\mathbf{x}^{(k)} - \mathbf{x}^*\|_\infty.
   $$


---

## **Osservazioni Chiave** 🔑
- La condizione $\|G(\mathbf{x})\|_\infty < 1$ è cruciale per garantire convergenza.  
- Se $L \approx 0$, la convergenza è **molto rapida**.  
- L'unicità del punto fisso è garantita **solo nell'intorno** \(S(\mathbf{x}^*, \rho)\).  

---

## **Formule Importanti** 🧮
- **Norma infinito di un vettore**:
  $$
  \|\mathbf{x}\|_\infty = \max_{1 \leq i \leq n} |x_i|.
  $$
- **Norma infinito della Jacobiana**:
  $$
  \|G(\mathbf{x})\|_\infty = \max_{i} \sum_{j=1}^n \left| \frac{\partial g_i}{\partial x_j}(\mathbf{x}) \right|.
  $$

