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
def rebuild_array(ary, n = 0, results = Array.new)
  return results if n >= (ary.length - 1)
  
  new_array = ary[n] + ary[n + 1] 
  results.push(new_array)
  rebuild_array(ary, (n + 2), results)    
end

# sort in pairs of 2
def sort_array(ary, n = 0, sorted_array = Array.new, compiled_array = Array.new)
  return compiled_array if n > (ary.length - 1)
  
  if ary[n][0] < ary[n][1]
      sorted_array << ary[n][0]
      sorted_array << ary[n][1]
  else 
      sorted_array << ary[n][1]
      sorted_array << ary[n][0]
  end
  compiled_array << sorted_array
  
  sort_array(ary, n + 1, sorted_array = Array.new, compiled_array)

end
# sort in pairs of multiples of 2 until the array is sorted