require 'test_helper'

class PracticeTechniquesControllerTest < ActionController::TestCase
  setup do
    @practice_technique = practice_techniques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practice_techniques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practice_technique" do
    assert_difference('PracticeTechnique.count') do
      post :create, :practice_technique => @practice_technique.attributes
    end

    assert_redirected_to practice_technique_path(assigns(:practice_technique))
  end

  test "should show practice_technique" do
    get :show, :id => @practice_technique.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @practice_technique.to_param
    assert_response :success
  end

  test "should update practice_technique" do
    put :update, :id => @practice_technique.to_param, :practice_technique => @practice_technique.attributes
    assert_redirected_to practice_technique_path(assigns(:practice_technique))
  end

  test "should destroy practice_technique" do
    assert_difference('PracticeTechnique.count', -1) do
      delete :destroy, :id => @practice_technique.to_param
    end

    assert_redirected_to practice_techniques_path
  end
end
