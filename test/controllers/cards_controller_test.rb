require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cards_index_url
    assert_response :success
  end

  test "should get new" do
    get cards_new_url
    assert_response :success
  end

  test "should get create" do
    get cards_create_url
    assert_response :success
  end

  test "should get edit" do
    get cards_edit_url
    assert_response :success
  end

  test "should get update" do
    get cards_update_url
    assert_response :success
  end

  test "should get complete" do
    get cards_complete_url
    assert_response :success
  end

  test "should get destroy" do
    get cards_destroy_url
    assert_response :success
  end

  test "should get set_card" do
    get cards_set_card_url
    assert_response :success
  end

  test "should get card_params" do
    get cards_card_params_url
    assert_response :success
  end

end
