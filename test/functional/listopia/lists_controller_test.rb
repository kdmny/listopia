require 'test_helper'

module Listopia
  class ListsControllerTest < ActionController::TestCase
    setup do
      @list = lists(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:lists)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create list" do
      assert_difference('List.count') do
        post :create, list: { bag: @list.bag, description: @list.description, items_count: @list.items_count, name: @list.name, slug: @list.slug, type: @list.type, user_id: @list.user_id }
      end
  
      assert_redirected_to list_path(assigns(:list))
    end
  
    test "should show list" do
      get :show, id: @list
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @list
      assert_response :success
    end
  
    test "should update list" do
      put :update, id: @list, list: { bag: @list.bag, description: @list.description, items_count: @list.items_count, name: @list.name, slug: @list.slug, type: @list.type, user_id: @list.user_id }
      assert_redirected_to list_path(assigns(:list))
    end
  
    test "should destroy list" do
      assert_difference('List.count', -1) do
        delete :destroy, id: @list
      end
  
      assert_redirected_to lists_path
    end
  end
end
