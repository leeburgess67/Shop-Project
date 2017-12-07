require('minitest/autorun')
require('minitest/rg')
require_relative('../shop')
require_relative('../customer')

class TestShop < MiniTest::Test


  def setup
    @hdmi = Stock.new("HDMI Cable", 5.99, 5000983746352, 56)
    @mouse = Stock.new("Mighty Mouse", 7.50, 5000392856632, 10)
    @monitor = Stock.new("40' Monitor", 199.99, 50000093665743, 5)
    @keyboard = Stock.new("Ergonomic Keyboard", 36.99, 5000009222546, 0)

    @jimbo = Customer.new("Jim", "Bobbertson", "Jimbo67", [@hdmi, @mouse], "5 Janefield Street, Glasgow, G17 5RT", "thisismypsassord123", 0)
    @bob = Customer.new("Bob", "Hegarty", "Bigbobo", [@monitor, @keyboard], "122a Muckleflats, Stirling, S45 3ER", "p@33w0rd99", 254.50)
    @simon = Customer.new("Simon", "Simpson", "Sososimpo", [], "45 Nice Street, Nice, N46 5GQ", "supersimpo3212", 235.43)


    @lees_shop = Shop.new([@jimbo, @bob, @simon], [@hdmi, @monitor, @mouse],
    { Monday: "8-5",
      Tuesday: "8-5",
      Wednesday: "8-5",
      Thursday: "8-5",
      Friday: "8-5",
      Saturday: "7-4"  }
      )
  end

    def test_shop_has_customers
      assert_equal(3, @lees_shop.customers.length)
    end

    def test_shop_has_stock
      assert_equal(3, @lees_shop.stock.length)
    end

    def test_display_opening_hours
      assert_equal("7-4", @lees_shop.check_opening_hrs(:Saturday))
    end







end
