require "application_system_test_case"

class TeamMembersTest < ApplicationSystemTestCase
  setup do
    @team_member = team_members(:one)
  end

  test "visiting the index" do
    visit team_members_url
    assert_selector "h1", text: "Team Members"
  end

  test "creating a Team member" do
    visit team_members_url
    click_on "New Team Member"

    fill_in "Bio", with: @team_member.bio
    fill_in "Full name", with: @team_member.full_name
    fill_in "Image", with: @team_member.image
    fill_in "Position", with: @team_member.position
    click_on "Create Team member"

    assert_text "Team member was successfully created"
    click_on "Back"
  end

  test "updating a Team member" do
    visit team_members_url
    click_on "Edit", match: :first

    fill_in "Bio", with: @team_member.bio
    fill_in "Full name", with: @team_member.full_name
    fill_in "Image", with: @team_member.image
    fill_in "Position", with: @team_member.position
    click_on "Update Team member"

    assert_text "Team member was successfully updated"
    click_on "Back"
  end

  test "destroying a Team member" do
    visit team_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team member was successfully destroyed"
  end
end
