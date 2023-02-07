require "application_system_test_case"

class SubscriptionPlansTest < ApplicationSystemTestCase
  setup do
    @subscription_plan = subscription_plans(:one)
  end

  test "visiting the index" do
    visit subscription_plans_url
    assert_selector "h1", text: "Subscription Plans"
  end

  test "creating a Subscription plan" do
    visit subscription_plans_url
    click_on "New Subscription Plan"

    click_on "Create Subscription plan"

    assert_text "Subscription plan was successfully created"
    click_on "Back"
  end

  test "updating a Subscription plan" do
    visit subscription_plans_url
    click_on "Edit", match: :first

    click_on "Update Subscription plan"

    assert_text "Subscription plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription plan" do
    visit subscription_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription plan was successfully destroyed"
  end
end
