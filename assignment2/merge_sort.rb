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

# sort in pairs of 2 elements until the array is sorted
def sort_element(left_array, right_array, results = Array.new)
  if left_array == []
    return results << right_array[0] if right_array.length == 1
      
      
      left_value = right_array[0]
      right_value = right_array[1]
      
      if left_value < right_value 
          results << right_value
          right_array.delete_at(0)
  
      else
          results << right_value
          right_array.delete_at(1)
      end
      
  elsif right_array == []
      return results << left_array[0] if left_array.length == 1
      
      left_value = left_array[0]
      right_value = left_array[1]
      
      if left_value < right_value 
          results << left_value
          left_array.delete_at(0)
  
      else
          results << right_value
          left_array.delete_at(1)
      end
      
      results
      
  else
     
      left_value = left_array[0]
      right_value = right_array[0]
  
      if left_value < right_value 
          results << left_value
          left_array.delete_at(0)
  
      else
          results << right_value
          right_array.delete_at(0)
      end
      
      results
  end
  
  results
  sort_element(left_array, right_array, results)
end

def compile_array(ary, n = 0, final_array = Array.new)
  # left and right side
  return final_array if n > (ary.length - 1)
  
  final_array << sort_element(ary[n], ary[n + 1], results = Array.new)
  
   compile_array(ary, n + 2, final_array)
end

