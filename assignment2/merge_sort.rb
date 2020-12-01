# break the array into individual segments
def break_array(ary, results = Array.new, final = [], org_ary = ary)
  ary1 = ary[0, ((ary.length.to_f)/2).ceil]
  ary2 = ary[-(ary.length/2), (ary.length/2)] 
  results << ary1
  results << ary2
  repeat_break_array(results, broke_array = Array.new, org_ary, n = 0)
end

def repeat_break_array(ary, broke_array = Array.new, ref, n)
  return broke_array if broke_array.length >= ref.length
  
  if (ary[n].empty? == true) 
      n += 1
  end
  
  if  (ary[n].length % 3) == 0
      broke_array << [ary[n][0]]
      ary[n].delete_at(0)
  elsif (ary[n].length % 2) == 0 
      broke_array << [ary[n][0]]
      broke_array << [ary[n][1]]
      ary[n].delete_at(0)
      ary[n].delete_at(0)
  else #for % 1 == 0 case
      broke_array << [ary[n][0]]
      ary[n].delete_at(0)
  end
  
  repeat_break_array(ary, broke_array, ref, n)
end

# sort in pairs of 2 elements until the array is sorted
def sort_element(left_array, right_array, results = Array.new)
  if left_array == []
    return results << right_array[0] if right_array.length == 1

      left_value = right_array[0]
      right_value = right_array[1]
      
      if left_value < right_value 
          results << left_value
          right_array.delete_at(0)
  
      else
          results << right_value
          right_array.delete_at(1)
      end
      
      results
  elsif ( (right_array == []) || (right_array.class == NilClass) )
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

def multi_array(ary, counter = 0, original_array)
  return ary if counter >= Math.log(original_array.length, 2).to_f.ceil
  ary = compile_array(ary, n = 0, final_array = Array.new)
  counter += 1
  
  multi_array(ary, counter, original_array)
end

def merge_sort(ary)
  ary = break_array(ary, results = Array.new, final = [])
  multi_array(ary, counter = 0, original_array = ary)
end
