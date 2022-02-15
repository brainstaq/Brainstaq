require "application_system_test_case"

class BusinessPlansTest < ApplicationSystemTestCase
  setup do
    @business_plan = business_plans(:one)
  end

  test "visiting the index" do
    visit business_plans_url
    assert_selector "h1", text: "Business Plans"
  end

  test "creating a Business plan" do
    visit business_plans_url
    click_on "New Business Plan"

    click_on "Create Business plan"

    assert_text "Business plan was successfully created"
    click_on "Back"
  end

  test "updating a Business plan" do
    visit business_plans_url
    click_on "Edit", match: :first

    click_on "Update Business plan"

    assert_text "Business plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Business plan" do
    visit business_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business plan was successfully destroyed"
  end
end
