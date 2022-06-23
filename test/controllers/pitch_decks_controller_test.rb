require "test_helper"

class PitchDecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pitch_deck = pitch_decks(:one)
  end

  test "should get index" do
    get pitch_decks_url
    assert_response :success
  end

  test "should get new" do
    get new_pitch_deck_url
    assert_response :success
  end

  test "should create pitch_deck" do
    assert_difference('PitchDeck.count') do
      post pitch_decks_url, params: { pitch_deck: {  } }
    end

    assert_redirected_to pitch_deck_url(PitchDeck.last)
  end

  test "should show pitch_deck" do
    get pitch_deck_url(@pitch_deck)
    assert_response :success
  end

  test "should get edit" do
    get edit_pitch_deck_url(@pitch_deck)
    assert_response :success
  end

  test "should update pitch_deck" do
    patch pitch_deck_url(@pitch_deck), params: { pitch_deck: {  } }
    assert_redirected_to pitch_deck_url(@pitch_deck)
  end

  test "should destroy pitch_deck" do
    assert_difference('PitchDeck.count', -1) do
      delete pitch_deck_url(@pitch_deck)
    end

    assert_redirected_to pitch_decks_url
  end
end
