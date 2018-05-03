require 'test_helper'

class HelpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help = helps(:one)
  end

  test "should get index" do
    get helps_url, as: :json
    assert_response :success
  end

  test "should create help" do
    assert_difference('Help.count') do
      post helps_url, params: { help: { description: @help.description, startDate: @help.startDate } }, as: :json
    end

    assert_response 201
  end

  test "should show help" do
    get help_url(@help), as: :json
    assert_response :success
  end

  test "should update help" do
    patch help_url(@help), params: { help: { description: @help.description, startDate: @help.startDate } }, as: :json
    assert_response 200
  end

  test "should destroy help" do
    assert_difference('Help.count', -1) do
      delete help_url(@help), as: :json
    end

    assert_response 204
  end
end
