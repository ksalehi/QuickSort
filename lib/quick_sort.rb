require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new {|x, y| x <=> y}
    return array if length <= 1
    pivot_idx = partition(array, start, length, &prc)
    left_length = pivot_idx - start
    right_length = length - (left_length + 1)
    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|x, y| x <=> y}
    pivot_idx = start
    pivot = array[pivot_idx]
    array[(start + 1)..(start+length-1)].each_with_index do |el, idx|
      if prc.call(el, pivot) <= 0 # if el < pivot
        array[pivot_idx] = el
        array[start + 1 + idx] = array[pivot_idx + 1]
        array[pivot_idx + 1] = pivot
        pivot_idx += 1
      end
    end
    pivot_idx
  end
end
