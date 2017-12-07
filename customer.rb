require_relative('./stock')

class Customer

attr_accessor :first_name, :last_name, :id, :basket, :address
attr_reader :pword, :bank_balance

  def initialize(first_name, last_name, id, basket, address, pword, bank_balance)
    @first_name = first_name
    @last_name = last_name
    @id = id
    @basket = basket
    @address = address
    @pword = pword
    @bank_balance = bank_balance
  end


  def add_to_basket(item)
     @basket << item
    end
  end

  def return_to_store(item)
    @basket.delete(item)
  end

  def display_basket_items
    return @basket[0].name + " " + @basket[1].name
  end

  def display_basket_value
    basket_value = @basket[0].price + @basket[1].price
    return basket_value.round(2)
  end

  def log_in
    puts "Please enter your user ID"
    user_id = gets.chomp
    puts "Please enter your password"
    password = gets.chomp

      if user_id == @id && password == @pword
      return true
        else
          return false
      end
    end

    def checkout
      if @bank_balance > display_basket_value
        return "Thank you for shopping with us today, your checkout total is #{display_basket_value}"
          else
            return "I'm sorry, you are skint. Please leave my shop immediately before I call the police."
          end
      end
  end
