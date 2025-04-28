## Definizione
La matrice Jacobiana è una rappresentazione matriciale delle **derivate parziali prime** di una [[funzione vettoriale]] $\mathbf{F}: \mathbb{R}^n \to \mathbb{R}^m$. Data:
$$
\mathbf{F}(\mathbf{x}) = \begin{bmatrix} f_1(x_1, ..., x_n) \\ \vdots \\ f_m(x_1, ..., x_n) \end{bmatrix},
$$
la Jacobiana $J$ è una matrice $m \times n$ con elementi:
$$
J_{ij} = \frac{\partial f_i}{\partial x_j}
$$

## Interpretazione Geometrica
- Approssimazione **lineare** locale della funzione $\mathbf{F}$ attorno a un punto $\mathbf{x}_0$.
- Descrive come $\mathbf{F}$ "deforma" lo spazio (es. stretching, rotazioni).

---

## Esempio Pratico
Sia $\mathbf{F}(x, y) = \begin{bmatrix} x^2 + y \\ \sin(x) \end{bmatrix}$:
$$
J = \begin{bmatrix} 
2x & 1 \\ 
\cos(x) & 0 
\end{bmatrix}
$$

> [!note]- Calcolo passo-passo
> - $\frac{\partial f_1}{\partial x} = 2x$
> - $\frac{\partial f_1}{\partial y} = 1$
> - $\frac{\partial f_2}{\partial x} = \cos(x)$
> - $\frac{\partial f_2}{\partial y} = 0$

---

## Applicazioni
1. **Metodo di [[Newton-Raphson]]**: Usato per risolvere sistemi non lineari.
2. **Stabilità in Sistemi Dinamici**:
   - Analisi degli autovalori dello Jacobiano nei [[Punti di Equilibrio]].
   - Se $\rho(J) < 1$ (→ [[raggio spettrale]]), il sistema è localmente stabile.
3. **Machine Learning**:
   - Calcolo del gradiente in reti neurali (backpropagation).
   - Ottimizzazione di funzioni multivariate.

---

## Relazioni con Altri Concetti
- **[[Matrice Hessiana]]**: Derivata seconda (Jacobiana del gradiente).
- **[[Divergenza]]**: Traccia della Jacobiana.
- **[[Rotore]]**: Combinazione di elementi Jacobiani in $\mathbb{R}^3$.

---

## Risorse
- **Video esplicativo**: [Jacobian Matrix (3Blue1Brown)](https://youtu.be/kYB8IZa5AuE)
- **Esercizi**: [Paul's Online Math Notes](https://tutorial.math.lamar.edu/)

