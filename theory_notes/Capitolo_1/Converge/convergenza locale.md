

- **Definizione**: Un algoritmo o metodo converge **localmente** se, partendo da un punto iniziale _sufficientemente vicino_ alla soluzione desiderata (es. un minimo, un punto fisso, una radice), riesce a raggiungerla.
    
- **Caratteristiche**:
    
    - Dipende fortemente dall'**ipotesi iniziale** (es. x_0​ vicino a x^∗).
        
    - Non garantisce risultati corretti se il punto di partenza è lontano.
        
- **Esempi**:
    
    - **[[clone/Capitolo_1/Newton-Raphson]]** (per trovare radici di equazioni): converge quadraticamente, ma solo se x0x0​ è vicino alla radice.
        
    - **Discesa del gradiente** (in ottimizzazione): converge a un minimo locale se la funzione è convessa nell'intorno del punto iniziale.


Si può sostituire la [[funzione di contrazione]] con una [[clone/Capitolo_1/pseudocontrattività]]

| Aspetto           | Convergenza Locale          |
| ----------------- | --------------------------- |
| Dipendenza da x_0 | x_0 vicino a x^*            |
| Velocità          | Spesso più veloce           |
| Applicabilità     | Problemi non convessi       |
| Sicurezza         | Risultato valido localmente |


Guardati bene il [[teorema convergenza locale]]