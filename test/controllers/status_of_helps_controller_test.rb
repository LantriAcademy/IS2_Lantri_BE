require 'test_helper'

class StatusOfHelpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_of_help = status_of_helps(:one)
  end

  test "should get index" do
    get status_of_helps_url, as: :json
    assert_response :success
  end

  test "should create status_of_help" do
    assert_difference('StatusOfHelp.count') do
      post status_of_helps_url, params: { status_of_help: { name: @status_of_help.name } }, as: :json
    end

    assert_response 201
  end

  test "should show status_of_help" do
    get status_of_help_url(@status_of_help), as: :json
    assert_response :success
  end

  test "should update status_of_help" do
    patch status_of_help_url(@status_of_help), params: { status_of_help: { name: @status_of_help.name } }, as: :json
    assert_response 200
  end

  test "should destroy status_of_help" do
    assert_difference('StatusOfHelp.count', -1) do
      delete status_of_help_url(@status_of_help), as: :json
    end

    assert_response 204
  end
end
