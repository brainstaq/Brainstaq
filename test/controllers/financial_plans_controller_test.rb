require "test_helper"

class FinancialPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_plan = financial_plans(:one)
  end

  test "should get index" do
    get financial_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_plan_url
    assert_response :success
  end

  test "should create financial_plan" do
    assert_difference('FinancialPlan.count') do
      post financial_plans_url, params: { financial_plan: {  } }
    end

    assert_redirected_to financial_plan_url(FinancialPlan.last)
  end

  test "should show financial_plan" do
    get financial_plan_url(@financial_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_plan_url(@financial_plan)
    assert_response :success
  end

  test "should update financial_plan" do
    patch financial_plan_url(@financial_plan), params: { financial_plan: {  } }
    assert_redirected_to financial_plan_url(@financial_plan)
  end

  test "should destroy financial_plan" do
    assert_difference('FinancialPlan.count', -1) do
      delete financial_plan_url(@financial_plan)
    end

    assert_redirected_to financial_plans_url
  end
end
