require "test_helper"

class IncomeStatementControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get income_statement_show_url
    assert_response :success
  end
end
