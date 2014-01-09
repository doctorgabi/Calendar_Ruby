#pass in a year and return true or false for leapyear.
class Year

  def leap(*year)

    if year[0].to_i % 400 == 0
      true
    elsif year[0].to_i % 100 == 0
      false
    elsif year[0].to_i % 4 == 0
      true
    else
      false
    end

  end

end