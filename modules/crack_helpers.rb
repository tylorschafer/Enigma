module CrackHelpers

    def base_shifts(message)
      base_shifts = Hash.new
      base_shifts['-4'] = (find_index(" ") - find_index(message[-4]))
      base_shifts['-3'] = (find_index("e") - find_index(message[-3]))
      base_shifts['-2'] = (find_index("n") - find_index(message[-2]))
      base_shifts['-1'] = (find_index("d") - find_index(message[-1]))
      base_shifts
    end

    def reformat_base_shifts(message)
      reformated_base_shifts = base_shifts(message)
      reformated_base_shifts.each do |num, shift|
        if shift > 0
          reformated_base_shifts[num] = 27 - shift
        else
          reformated_base_shifts[num] = shift.abs
        end
      end
      reformated_base_shifts
    end

    def assign_shifts(message)
      assigned_shifts = Hash.new(0)
      reformat_base_shifts(message).each do |num, shift|
        assigned_shifts[:a] += shift if message.length % 4 + num.to_i == 0 || message.length % 4 + num.to_i == -4
        assigned_shifts[:b] += shift if message.length % 4 + num.to_i == 1 || message.length % 4 + num.to_i == -3
        assigned_shifts[:c] += shift if message.length % 4 + num.to_i == 2 || message.length % 4 + num.to_i == -2
        assigned_shifts[:d] += shift if message.length % 4 + num.to_i == -1
      end
      assigned_shifts.sort.to_h
    end
end
