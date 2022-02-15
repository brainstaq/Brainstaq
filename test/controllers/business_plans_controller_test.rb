require "test_helper"

class BusinessPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_plan = business_plans(:one)
  end

  test "should get index" do
    get business_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_business_plan_url
    assert_response :success
  end

  test "should create business_plan" do
    assert_difference('BusinessPlan.count') do
      post business_plans_url, params: { business_plan: {  } }
    end

    assert_redirected_to business_plan_url(BusinessPlan.last)
  end

  test "should show business_plan" do
    get business_plan_url(@business_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_plan_url(@business_plan)
    assert_response :success
  end

  test "should update business_plan" do
    patch business_plan_url(@business_plan), params: { business_plan: {  } }
    assert_redirected_to business_plan_url(@business_plan)
  end

  test "should destroy business_plan" do
    assert_difference('BusinessPlan.count', -1) do
      delete business_plan_url(@business_plan)
    end

    assert_redirected_to business_plans_url
  end
end
