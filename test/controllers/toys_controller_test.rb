require "test_helper"

class ToysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toy = toys(:one)
  end

  test "should get index" do
    get toys_url, as: :json
    assert_response :success
  end

  test "should create toy" do
    assert_difference('Toy.count') do
      post toys_url, params: { toy: { brand: @toy.brand, crinkle: @toy.crinkle, name: @toy.name, needs_repair: @toy.needs_repair, photo: @toy.photo, price: @toy.price, rating: @toy.rating, squeaker: @toy.squeaker, treat: @toy.treat, url: @toy.url } }, as: :json
    end

    assert_response 201
  end

  test "should show toy" do
    get toy_url(@toy), as: :json
    assert_response :success
  end

  test "should update toy" do
    patch toy_url(@toy), params: { toy: { brand: @toy.brand, crinkle: @toy.crinkle, name: @toy.name, needs_repair: @toy.needs_repair, photo: @toy.photo, price: @toy.price, rating: @toy.rating, squeaker: @toy.squeaker, treat: @toy.treat, url: @toy.url } }, as: :json
    assert_response 200
  end

  test "should destroy toy" do
    assert_difference('Toy.count', -1) do
      delete toy_url(@toy), as: :json
    end

    assert_response 204
  end
end
