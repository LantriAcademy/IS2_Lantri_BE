require 'test_helper'

class BenefitedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @benefited = benefiteds(:one)
  end

  test "should get index" do
    get benefiteds_url, as: :json
    assert_response :success
  end

  test "should create benefited" do
    assert_difference('Benefited.count') do
      post benefiteds_url, params: { benefited: { age: @benefited.age, preferences: @benefited.preferences } }, as: :json
    end

    assert_response 201
  end

  test "should show benefited" do
    get benefited_url(@benefited), as: :json
    assert_response :success
  end

  test "should update benefited" do
    patch benefited_url(@benefited), params: { benefited: { age: @benefited.age, preferences: @benefited.preferences } }, as: :json
    assert_response 200
  end

  test "should destroy benefited" do
    assert_difference('Benefited.count', -1) do
      delete benefited_url(@benefited), as: :json
    end

    assert_response 204
  end
end
