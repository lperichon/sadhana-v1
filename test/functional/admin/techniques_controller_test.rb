require 'test_helper'

class Admin::TechniquesControllerTest < ActionController::TestCase
  setup do
    @technique = Technique.make
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:techniques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create technique" do
    assert_difference('Technique.count') do
      post :create, :technique => @technique.attributes
    end

    assert_redirected_to admin_technique_path(assigns(:technique))
  end

  test "should show technique" do
    get :show, :id => @technique.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @technique.to_param
    assert_response :success
  end

  test "should update technique" do
    put :update, :id => @technique.to_param, :technique => @technique.attributes
    assert_redirected_to admin_technique_path(assigns(:technique))
  end

  test "should destroy technique" do
    assert_difference('Technique.count', -1) do
      delete :destroy, :id => @technique.to_param
    end

    assert_redirected_to admin_techniques_path
  end
end
