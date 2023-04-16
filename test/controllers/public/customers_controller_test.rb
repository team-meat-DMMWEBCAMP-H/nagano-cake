require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_customers_new_url
    assert_response :success
  end
end
