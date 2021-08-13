require "test_helper"

class PlanSubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan_subscription = plan_subscriptions(:one)
  end

  test "should get index" do
    get plan_subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_subscription_url
    assert_response :success
  end

  test "should create plan_subscription" do
    assert_difference('PlanSubscription.count') do
      post plan_subscriptions_url, params: { plan_subscription: {  } }
    end

    assert_redirected_to plan_subscription_url(PlanSubscription.last)
  end

  test "should show plan_subscription" do
    get plan_subscription_url(@plan_subscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_subscription_url(@plan_subscription)
    assert_response :success
  end

  test "should update plan_subscription" do
    patch plan_subscription_url(@plan_subscription), params: { plan_subscription: {  } }
    assert_redirected_to plan_subscription_url(@plan_subscription)
  end

  test "should destroy plan_subscription" do
    assert_difference('PlanSubscription.count', -1) do
      delete plan_subscription_url(@plan_subscription)
    end

    assert_redirected_to plan_subscriptions_url
  end
end
