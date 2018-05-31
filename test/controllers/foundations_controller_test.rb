require 'test_helper'

class FoundationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foundation = foundations(:one)
  end

  test "should get index" do
    get foundations_url, as: :json
    assert_response :success
  end

  test "should create foundation" do
    assert_difference('Foundation.count') do
      post foundations_url, params: { foundation: { direction: @foundation.direction, latitude: @foundation.latitude, longitude: @foundation.longitude, name: @foundation.name } }, as: :json
    end

    assert_response 201
  end

  test "should show foundation" do
    get foundation_url(@foundation), as: :json
    assert_response :success
  end

  test "should update foundation" do
    patch foundation_url(@foundation), params: { foundation: { direction: @foundation.direction, latitude: @foundation.latitude, longitude: @foundation.longitude, name: @foundation.name } }, as: :json
    assert_response 200
  end

  test "should destroy foundation" do
    assert_difference('Foundation.count', -1) do
      delete foundation_url(@foundation), as: :json
    end

    assert_response 204
  end
end
