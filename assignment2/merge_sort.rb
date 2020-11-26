# break the array into individual segments
def break_array(ary)
  return true if ary.length == 1
        
  Array.new(ary[0, (ary.length/2) ] )
  Array.new(ary[-(ary.length/2), (ary.length/2) ] )
end
# sort the array

# sort in pairs of 2

# sort in pairs of multiples of 2 until the array is sorted