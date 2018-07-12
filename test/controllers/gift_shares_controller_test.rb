require 'test_helper'

class GiftSharesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gift_shares_show_url
    assert_response :success
  end

end
