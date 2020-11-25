def fibs_rec(n)
    ( (n == 0) || (n == 1) ) ? n : fibs_rec(n - 1) + fibs_rec(n - 2)
end