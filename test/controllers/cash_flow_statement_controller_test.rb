require "test_helper"

class CashFlowStatementControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cash_flow_statement_show_url
    assert_response :success
  end
end
