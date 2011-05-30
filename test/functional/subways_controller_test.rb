require 'test_helper'

class SubwaysControllerTest < ActionController::TestCase
  setup do
    @subway = subways(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subway" do
    assert_difference('Subway.count') do
      post :create, :subway => @subway.attributes
    end

    assert_redirected_to subway_path(assigns(:subway))
  end

  test "should show subway" do
    get :show, :id => @subway.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subway.to_param
    assert_response :success
  end

  test "should update subway" do
    put :update, :id => @subway.to_param, :subway => @subway.attributes
    assert_redirected_to subway_path(assigns(:subway))
  end

  test "should destroy subway" do
    assert_difference('Subway.count', -1) do
      delete :destroy, :id => @subway.to_param
    end

    assert_redirected_to subways_path
  end
end
