# break the array into individual segments
def break_array(ary, results = Array.new, final = [])
  if ary.length == 1
    final << ary
    
  else  
    results.push(ary[0, (ary.length/2) ] )
    results.push(ary[-(ary.length/2), (ary.length/2) ] )

    ary = results

    ary.each do |element|
      if element.class == Array then
        break_array(element, results = Array.new, final)
      end
    end
    final
  end
end
# sort the array

# sort in pairs of 2

# sort in pairs of multiples of 2 until the array is sorted