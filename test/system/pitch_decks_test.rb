require "application_system_test_case"

class PitchDecksTest < ApplicationSystemTestCase
  setup do
    @pitch_deck = pitch_decks(:one)
  end

  test "visiting the index" do
    visit pitch_decks_url
    assert_selector "h1", text: "Pitch Decks"
  end

  test "creating a Pitch deck" do
    visit pitch_decks_url
    click_on "New Pitch Deck"

    click_on "Create Pitch deck"

    assert_text "Pitch deck was successfully created"
    click_on "Back"
  end

  test "updating a Pitch deck" do
    visit pitch_decks_url
    click_on "Edit", match: :first

    click_on "Update Pitch deck"

    assert_text "Pitch deck was successfully updated"
    click_on "Back"
  end

  test "destroying a Pitch deck" do
    visit pitch_decks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pitch deck was successfully destroyed"
  end
end
