require "test_helper"

class Shop::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shop_orders_show_url
    assert_response :success
  end
end
