require 'test_helper'

class EvidencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence = evidences(:one)
  end

  test "should get index" do
    get evidences_url, as: :json
    assert_response :success
  end

  test "should create evidence" do
    assert_difference('Evidence.count') do
      post evidences_url, params: { evidence: { description: @evidence.description } }, as: :json
    end

    assert_response 201
  end

  test "should show evidence" do
    get evidence_url(@evidence), as: :json
    assert_response :success
  end

  test "should update evidence" do
    patch evidence_url(@evidence), params: { evidence: { description: @evidence.description } }, as: :json
    assert_response 200
  end

  test "should destroy evidence" do
    assert_difference('Evidence.count', -1) do
      delete evidence_url(@evidence), as: :json
    end

    assert_response 204
  end
end
