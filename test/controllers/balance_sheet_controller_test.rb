require "test_helper"

class BalanceSheetControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get balance_sheet_show_url
    assert_response :success
  end
end
