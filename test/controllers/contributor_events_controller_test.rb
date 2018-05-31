require 'test_helper'

class ContributorEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contributor_event = contributor_events(:one)
  end

  test "should get index" do
    get contributor_events_url, as: :json
    assert_response :success
  end

  test "should create contributor_event" do
    assert_difference('ContributorEvent.count') do
      post contributor_events_url, params: { contributor_event: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show contributor_event" do
    get contributor_event_url(@contributor_event), as: :json
    assert_response :success
  end

  test "should update contributor_event" do
    patch contributor_event_url(@contributor_event), params: { contributor_event: {  } }, as: :json
    assert_response 200
  end

  test "should destroy contributor_event" do
    assert_difference('ContributorEvent.count', -1) do
      delete contributor_event_url(@contributor_event), as: :json
    end

    assert_response 204
  end
end
