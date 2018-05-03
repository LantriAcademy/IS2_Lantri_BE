require 'test_helper'

class InterestContributorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest_contributor = interest_contributors(:one)
  end

  test "should get index" do
    get interest_contributors_url, as: :json
    assert_response :success
  end

  test "should create interest_contributor" do
    assert_difference('InterestContributor.count') do
      post interest_contributors_url, params: { interest_contributor: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show interest_contributor" do
    get interest_contributor_url(@interest_contributor), as: :json
    assert_response :success
  end

  test "should update interest_contributor" do
    patch interest_contributor_url(@interest_contributor), params: { interest_contributor: {  } }, as: :json
    assert_response 200
  end

  test "should destroy interest_contributor" do
    assert_difference('InterestContributor.count', -1) do
      delete interest_contributor_url(@interest_contributor), as: :json
    end

    assert_response 204
  end
end
