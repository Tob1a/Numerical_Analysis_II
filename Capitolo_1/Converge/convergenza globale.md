

- **Definizione**: Un algoritmo converge **globalmente** se riesce a raggiungere la soluzione desiderata _indipendentemente_ dal punto iniziale scelto nel dominio di definizione.
    
- **Caratteristiche**:
    
    - Non dipende dalla scelta di x_0​.
        
    - Richiede condizioni più restrittive (es. funzioni convesse, strutture particolari).
        
- **Esempi**:
    
    - **Metodo del simplesso** (in programmazione lineare): trova sempre la soluzione ottima per problemi lineari, partendo da qualsiasi punto ammissibile.
        
    - **Algoritmi genetici o simulated annealing** (in ottimizzazione globale): esplorano l'intero spazio per evitare minimi locali.



| Aspetto           | Convergenza Globale                        |
| ----------------- | ------------------------------------------ |
| Dipendenza da x_0 | funziona per qualsiasi x_0                 |
| Velocità          | Può essere lenta                           |
| Applicabilità     | Richiede condizioni forti (es. convessità) |
| Sicurezza         | Soluzione ottima "vera" (se esiste)        |
