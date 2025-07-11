# **Residuo nella Norma Euclidea** 📏

## Definizione  
Il **residuo** associato a un sistema lineare $A\mathbf{x} = \mathbf{b}$ è definito come:  
$\mathbf{r} = \mathbf{b} - A\mathbf{x}$
La sua **norma euclidea** (o norma $( \ell^2 )$ è:  $\|\mathbf{r}\|_2 = \sqrt{\sum_{i=1}^n (b_i - (A\mathbf{x})_i)^2}$
Questa quantità misura l'"errore assoluto" tra il termine noto $\mathbf{b}$ e l'approssimazione $( A\mathbf{x} )$.

### **Formula**

Dato un vettore x (approssimazione della soluzione):

$Residuo=b−Ax$
$Norma Euclidea del Residuo=∥b−Ax∥2=\sqrt{∑_{i=1}^n(b_i−(Ax)_i)^2}​$

---

## **Interpretazione Geometrica** 🎯

- La norma euclidea del residuo rappresenta la **distanza** tra il vettore b e il vettore Ax nello spazio R^n.
    
- Più piccolo è $∥b−Ax∥2∥b−Ax∥^2$​, migliore è l'approssimazione x.
    

---

## Esempio Pratico  
**Sistema lineare:**  
$$
\begin{cases} 
2x + y = 3 \\ 
x - y = 1 
\end{cases}
$$
- **Soluzione esatta:** $\mathbf{x}^* = \left(\frac{4}{3}, \frac{1}{3}\right)$.  
- **Approssimazione:** $\mathbf{x} = (1, 1)$.  

**Calcolo del residuo:**  
$$
\mathbf{r} = \begin{bmatrix} 3 \\ 1 \end{bmatrix} - \begin{bmatrix} 2 \cdot 1 + 1 \cdot 1 \\ 1 \cdot 1 - 1 \cdot 1 \end{bmatrix} = \begin{bmatrix} 0 \\ 1 \end{bmatrix}
$$  
$$
\|\mathbf{r}\|_2 = \sqrt{0^2 + 1^2} = 1.
$$

---

## A Cosa Serve? 🔧  
1. **Verifica della soluzione:**  
   - Un residuo $\|\mathbf{r}\|_2 \approx 0$ indica una buona approssimazione.  
1. **Metodi iterativi** (es. Gradiente Coniugato):  
   - Si minimizza $\|\mathbf{r}\|_2$ per convergere alla soluzione.  
1. **Minimi Quadrati:**  
   - Problemi sovradeterminati: si cerca $\mathbf{x}$ che minimizza $\|\mathbf{b} - A\mathbf{x}\|_2$.

---

## Confronto con Altre Norme  
| Norma             | Formula                                | Caratteristiche            |     |                           |     |
| ----------------- | -------------------------------------- | -------------------------- | --- | ------------------------- | --- |
| **$\ell^1$**      | $\|\mathbf{r}\|_1 = \sum$              | r_i                        |     | Robustà agli outlier.     |     |
| **$\ell^2$**      | $\|\mathbf{r}\|_2 = \sqrt{\sum r_i^2}$ | Sensibile a errori grandi. |     |                           |     |
| **$\ell^\infty$** | $\|\mathbf{r}\|_\infty = \max$         | r_i                        |     | Misura il peggior errore. |     |

---

## Nota Importante ⚠️  
- Un residuo piccolo **non garantisce** un errore piccolo su $ \mathbf{x} $ se la matrice $ A $ è **mal condizionata** (alto numero di condizionamento).  
- Esempio: Se $ \text{cond}(A) \gg 1 $, $ \|\mathbf{r}\|_2 $ piccolo può nascondere errori grandi in $ \mathbf{x} $.

---

## Link Correlati  
- Sistemi Lineari  
- Numero di Condizionamento]]  
- Metodo dei Minimi Quadrati]]  

> **Suggerimento:** Usa la norma euclidea per ottimizzazioni "lisce" e problemi di regressione! 🎯