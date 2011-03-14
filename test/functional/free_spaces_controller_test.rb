require 'test_helper'

class FreeSpacesControllerTest < ActionController::TestCase
  setup do
    @free_space = free_spaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:free_spaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create free_space" do
    assert_difference('FreeSpace.count') do
      post :create, :free_space => @free_space.attributes
    end

    assert_redirected_to free_space_path(assigns(:free_space))
  end

  test "should show free_space" do
    get :show, :id => @free_space.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @free_space.to_param
    assert_response :success
  end

  test "should update free_space" do
    put :update, :id => @free_space.to_param, :free_space => @free_space.attributes
    assert_redirected_to free_space_path(assigns(:free_space))
  end

  test "should destroy free_space" do
    assert_difference('FreeSpace.count', -1) do
      delete :destroy, :id => @free_space.to_param
    end

    assert_redirected_to free_spaces_path
  end
end
