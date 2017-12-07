require('minitest/autorun')
require('minitest/rg')
require_relative('../stock')

class TestStock < MiniTest::Test


  def setup
    @hdmi = Stock.new("HDMI Cable", 5.99, 5000983746352, 56)
    @mouse = Stock.new("Mighty Mouse", 7.50, 5000392856632, 10)
    @monitor = Stock.new("40' Monitor", 199.99, 5000083374653, 5)
    @keyboard = Stock.new("Ergonomic Keyboard", 36.99, 5000009222546, 0)
  end

    def test_stock_has_name
      assert_equal("HDMI Cable", @hdmi.name)
    end

    def test_check_price
      assert_equal(7.50, @mouse.price)
    end

    def test_stock_has_valid_ean_of_13_digits
      assert_equal(13, @monitor.ean.to_s.length)
    end

    def test_check_stock_holding
      assert_equal(0, @keyboard.stockholding)
    end

    def test_remove_from_stockholding_when_item_sells
      assert_equal(3, @monitor.sell(2))
    end

    def test_to_stockholding_when_item_returned
      assert_equal(58, @hdmi.return(2))
    end




end
