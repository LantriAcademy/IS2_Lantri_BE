require 'test_helper'

class SupportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support = supports(:one)
  end

  test "should get index" do
    get supports_url, as: :json
    assert_response :success
  end

  test "should create support" do
    assert_difference('Support.count') do
      post supports_url, params: { support: { date: @support.date, description: @support.description } }, as: :json
    end

    assert_response 201
  end

  test "should show support" do
    get support_url(@support), as: :json
    assert_response :success
  end

  test "should update support" do
    patch support_url(@support), params: { support: { date: @support.date, description: @support.description } }, as: :json
    assert_response 200
  end

  test "should destroy support" do
    assert_difference('Support.count', -1) do
      delete support_url(@support), as: :json
    end

    assert_response 204
  end
end
