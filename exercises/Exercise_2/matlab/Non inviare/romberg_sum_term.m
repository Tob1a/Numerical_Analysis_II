function S = romberg_sum_term(f, a, h, k)
    n = 2^(k - 2);  % numero di nuovi punti
    S = 0;
    for j = 1:n
        xj = a + (2*j - 1)*h;
        S = S + f(xj);
    end
end
