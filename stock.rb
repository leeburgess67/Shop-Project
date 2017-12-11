
class Stock

attr_accessor :name, :price, :ean, :stockholding

  def initialize(name, price, ean, stockholding)
    @name = name
    @price = price
    @ean = ean
    @stockholding = stockholding
  end


  def sell(quantity)
  new_stock_holding = @stockholding - quantity
    return new_stock_holding
  end

  def return(quantity)
  new_stock_holding = @stockholding + quantity
    return new_stock_holding
  end


end
