def fibs(n)
  sum = 0    
  return sum = n if ( (n == 0) || (n == 1))
  x = 0
  y = 1
    
  i = 2 
  while i <= n do 
    sum = x + y
    x = y
    y = sum
    
    i += 1
  end
  sum
end 