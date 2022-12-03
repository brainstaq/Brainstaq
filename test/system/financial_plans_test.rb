require "application_system_test_case"

class FinancialPlansTest < ApplicationSystemTestCase
  setup do
    @financial_plan = financial_plans(:one)
  end

  test "visiting the index" do
    visit financial_plans_url
    assert_selector "h1", text: "Financial Plans"
  end

  test "creating a Financial plan" do
    visit financial_plans_url
    click_on "New Financial Plan"

    click_on "Create Financial plan"

    assert_text "Financial plan was successfully created"
    click_on "Back"
  end

  test "updating a Financial plan" do
    visit financial_plans_url
    click_on "Edit", match: :first

    click_on "Update Financial plan"

    assert_text "Financial plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Financial plan" do
    visit financial_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Financial plan was successfully destroyed"
  end
end
