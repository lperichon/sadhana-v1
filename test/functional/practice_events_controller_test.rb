require 'test_helper'

class PracticeEventsControllerTest < ActionController::TestCase
  setup do
    @practice_event = practice_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practice_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practice_event" do
    assert_difference('PracticeEvent.count') do
      post :create, :practice_event => @practice_event.attributes
    end

    assert_redirected_to practice_event_path(assigns(:practice_event))
  end

  test "should show practice_event" do
    get :show, :id => @practice_event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @practice_event.to_param
    assert_response :success
  end

  test "should update practice_event" do
    put :update, :id => @practice_event.to_param, :practice_event => @practice_event.attributes
    assert_redirected_to practice_event_path(assigns(:practice_event))
  end

  test "should destroy practice_event" do
    assert_difference('PracticeEvent.count', -1) do
      delete :destroy, :id => @practice_event.to_param
    end

    assert_redirected_to practice_events_path
  end
end
