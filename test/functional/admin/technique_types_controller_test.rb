require 'test_helper'

class Admin::TechniqueTypesControllerTest < ActionController::TestCase
  setup do
    @technique_type = TechniqueType.make
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:technique_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create technique_type" do
    assert_difference('TechniqueType.count') do
      post :create, :technique_type => @technique_type.attributes
    end

    assert_redirected_to admin_technique_type_path(assigns(:technique_type))
  end

  test "should show technique_type" do
    get :show, :id => @technique_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @technique_type.to_param
    assert_response :success
  end

  test "should update technique_type" do
    put :update, :id => @technique_type.to_param, :technique_type => @technique_type.attributes
    assert_redirected_to admin_technique_type_path(assigns(:technique_type))
  end

  test "should destroy technique_type" do
    assert_difference('TechniqueType.count', -1) do
      delete :destroy, :id => @technique_type.to_param
    end

    assert_redirected_to admin_technique_types_path
  end
end
