require "application_system_test_case"

class PlanSubscriptionsTest < ApplicationSystemTestCase
  setup do
    @plan_subscription = plan_subscriptions(:one)
  end

  test "visiting the index" do
    visit plan_subscriptions_url
    assert_selector "h1", text: "Plan Subscriptions"
  end

  test "creating a Plan subscription" do
    visit plan_subscriptions_url
    click_on "New Plan Subscription"

    click_on "Create Plan subscription"

    assert_text "Plan subscription was successfully created"
    click_on "Back"
  end

  test "updating a Plan subscription" do
    visit plan_subscriptions_url
    click_on "Edit", match: :first

    click_on "Update Plan subscription"

    assert_text "Plan subscription was successfully updated"
    click_on "Back"
  end

  test "destroying a Plan subscription" do
    visit plan_subscriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plan subscription was successfully destroyed"
  end
end
