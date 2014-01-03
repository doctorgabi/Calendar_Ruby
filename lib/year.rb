#pass in a year and return true or false for leapyear.
class Year

  def leap(*year)

    if year
      a = year[0].to_i % 400
      b = year[0].to_i % 100
      c = year[0].to_i % 4

      leap = false

      if a == 0 && b == 0
        leap = true
      elsif a != 0 && b == 0
        leap = false
      elsif c == 0
        leap = true
      end

    end

    leap

  end

end