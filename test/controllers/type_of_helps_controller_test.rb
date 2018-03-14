require 'test_helper'

class TypeOfHelpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_help = type_of_helps(:one)
  end

  test "should get index" do
    get type_of_helps_url, as: :json
    assert_response :success
  end

  test "should create type_of_help" do
    assert_difference('TypeOfHelp.count') do
      post type_of_helps_url, params: { type_of_help: { name: @type_of_help.name } }, as: :json
    end

    assert_response 201
  end

  test "should show type_of_help" do
    get type_of_help_url(@type_of_help), as: :json
    assert_response :success
  end

  test "should update type_of_help" do
    patch type_of_help_url(@type_of_help), params: { type_of_help: { name: @type_of_help.name } }, as: :json
    assert_response 200
  end

  test "should destroy type_of_help" do
    assert_difference('TypeOfHelp.count', -1) do
      delete type_of_help_url(@type_of_help), as: :json
    end

    assert_response 204
  end
end
