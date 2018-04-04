require 'test_helper'

class InterestFoundationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest_foundation = interest_foundations(:one)
  end

  test "should get index" do
    get interest_foundations_url, as: :json
    assert_response :success
  end

  test "should create interest_foundation" do
    assert_difference('InterestFoundation.count') do
      post interest_foundations_url, params: { interest_foundation: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show interest_foundation" do
    get interest_foundation_url(@interest_foundation), as: :json
    assert_response :success
  end

  test "should update interest_foundation" do
    patch interest_foundation_url(@interest_foundation), params: { interest_foundation: {  } }, as: :json
    assert_response 200
  end

  test "should destroy interest_foundation" do
    assert_difference('InterestFoundation.count', -1) do
      delete interest_foundation_url(@interest_foundation), as: :json
    end

    assert_response 204
  end
end
