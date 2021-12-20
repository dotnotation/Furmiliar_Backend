require "test_helper"

class ToyBoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toy_box = toy_boxes(:one)
  end

  test "should get index" do
    get toy_boxes_url, as: :json
    assert_response :success
  end

  test "should create toy_box" do
    assert_difference('ToyBox.count') do
      post toy_boxes_url, params: { toy_box: { name: @toy_box.name, photo: @toy_box.photo } }, as: :json
    end

    assert_response 201
  end

  test "should show toy_box" do
    get toy_box_url(@toy_box), as: :json
    assert_response :success
  end

  test "should update toy_box" do
    patch toy_box_url(@toy_box), params: { toy_box: { name: @toy_box.name, photo: @toy_box.photo } }, as: :json
    assert_response 200
  end

  test "should destroy toy_box" do
    assert_difference('ToyBox.count', -1) do
      delete toy_box_url(@toy_box), as: :json
    end

    assert_response 204
  end
end
