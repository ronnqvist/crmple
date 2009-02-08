require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => people(:paavo).id
    assert_response :success
  end
  
  test "should get show" do
    get :show, :id => people(:paavo).id
    assert_response :success
  end
  
  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete :destroy, :id => people(:paavo).id
    end
    assert_redirected_to people_path
  end
  
  test "should update person" do
    put :update, :id => people(:paavo).id, :person => {}
    assert_redirected_to person_path(assigns(:person))
  end
  
  test "should create person" do
    assert_difference("Person.count") do
      post :create, :person => people(:paavo).attributes
    end
    assert_redirected_to person_path(assigns(:person))
  end
end
