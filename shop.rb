class Shop

attr_accessor :customers, :stock, :opening_hrs

  def initialize(customers, stock, opening_hrs)
    @customers = customers
    @stock = stock
    @opening_hrs = opening_hrs

  end

  def check_opening_hrs(day)
    if day == :Monday
      return "8-5"
        elsif day == :Tuesday
          return "8-5"
            elsif day == :Wednesday
              return "8-5"
                elsif day == :Thursday
                  return "8-5"
                    elsif day == :Friday
                      return "8-5"
                        elsif day == :Saturday
                          return "7-4"
                            else
                              return "That is not a valid day, please try again"



    end
  end

end
