require 'test_helper'

class Admin::SectionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sections" do
    assert_difference('Admin::Sections.count') do
      post :create, :sections => { }
    end

    assert_redirected_to sections_path(assigns(:sections))
  end

  test "should show sections" do
    get :show, :id => admin_sections(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_sections(:one).id
    assert_response :success
  end

  test "should update sections" do
    put :update, :id => admin_sections(:one).id, :sections => { }
    assert_redirected_to sections_path(assigns(:sections))
  end

  test "should destroy sections" do
    assert_difference('Admin::Sections.count', -1) do
      delete :destroy, :id => admin_sections(:one).id
    end

    assert_redirected_to admin_sections_path
  end
end
