require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../stock')


class TestCustomer < MiniTest::Test

  def setup

    @hdmi = Stock.new("HDMI Cable", 5.99, 5000983746352, 56)
    @mouse = Stock.new("Mighty Mouse", 7.50, 5000392856632, 10)
    @monitor = Stock.new("40' Monitor", 199.99, 5000083374651, 5)
    @keyboard = Stock.new("Ergonomic Keyboard", 36.99, 5000009222546, 0)

    @jimbo = Customer.new("Jim", "Bobbertson", "Jimbo67", [@hdmi, @mouse], "5 Janefield Street, Glasgow, G17 5RT", "thisismypassword123", 0)
    @bob = Customer.new("Bob", "Hegarty", "Bigbobo", [@monitor, @keyboard], "122a Muckleflats, Stirling, S45 3ER", "p@33w0rd99", 254.50)
    @simon = Customer.new("Simon", "Simpson", "Sososimpo", [], "45 Nice Street, Nice, N46 5GQ", "supersimpo3212", 235.43)
  end

    def test_customer_has_first_name
      assert_equal("Jim", @jimbo.first_name)
    end

    def test_customer_has_last_name
      assert_equal("Hegarty", @bob.last_name)
    end

    def test_customer_has_id
      assert_equal("Bigbobo", @bob.id)
    end

    def test_number_of_items_in_customers_basket
      assert_equal(2, @bob.basket.length)
    end

    def test_customer_has_address
      assert_equal("122a Muckleflats, Stirling, S45 3ER", @bob.address)
    end

    def test_customer_has_password
      assert_equal("supersimpo3212", @simon.pword)
    end

    def test_customer_had_bank_balance
      assert_equal(254.50, @bob.bank_balance)
    end

    def test_customer_can_add_to_basket
      @bob.add_to_basket(@hdmi)
      assert_equal(3, @bob.basket.length)
    end

    def test_customer_can_return_item
      @jimbo.return_to_store(@hdmi)
      assert_equal(1, @jimbo.basket.length)
    end

    def test_customer_can_display_basket_items
      assert_equal("40' Monitor\nErgonomic Keyboard", @bob.display_basket_items)
    end

    def test_customer_can_display_basket_value
      assert_equal(13.49, @jimbo.display_basket_value)
    end

    def test_customer_can_log_in
      assert_equal(true,@jimbo.log_in)
    end

    def test_customer_can_checkout_if_has_enough_money
    assert_equal("Thank you for shopping with us today, your checkout total is £236.98", @bob.checkout)
    end

    def test_customer_can_checkout_if_not_enough_money
      assert_equal("I'm sorry, you are skint. Please leave my shop immediately before I call the police.", @jimbo.checkout)
    end
end
