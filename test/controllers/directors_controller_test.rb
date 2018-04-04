require 'test_helper'

class DirectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @director = directors(:one)
  end

  test "should get index" do
    get directors_url, as: :json
    assert_response :success
  end

  test "should create director" do
    assert_difference('Director.count') do
      post directors_url, params: { director: { bio: @director.bio, email: @director.email, lastname: @director.lastname, name: @director.name, pass: @director.pass, phone: @director.phone, user: @director.user } }, as: :json
    end

    assert_response 201
  end

  test "should show director" do
    get director_url(@director), as: :json
    assert_response :success
  end

  test "should update director" do
    patch director_url(@director), params: { director: { bio: @director.bio, email: @director.email, lastname: @director.lastname, name: @director.name, pass: @director.pass, phone: @director.phone, user: @director.user } }, as: :json
    assert_response 200
  end

  test "should destroy director" do
    assert_difference('Director.count', -1) do
      delete director_url(@director), as: :json
    end

    assert_response 204
  end
end
