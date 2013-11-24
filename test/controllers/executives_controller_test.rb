require 'test_helper'

class ExecutivesControllerTest < ActionController::TestCase
  setup do
    @executive = executives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:executives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create executive" do
    assert_difference('Executive.count') do
      post :create, executive: { first_name: @executive.first_name, last_name: @executive.last_name, phone_number_id: @executive.phone_number_id }
    end

    assert_redirected_to executive_path(assigns(:executive))
  end

  test "should show executive" do
    get :show, id: @executive
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @executive
    assert_response :success
  end

  test "should update executive" do
    patch :update, id: @executive, executive: { first_name: @executive.first_name, last_name: @executive.last_name, phone_number_id: @executive.phone_number_id }
    assert_redirected_to executive_path(assigns(:executive))
  end

  test "should destroy executive" do
    assert_difference('Executive.count', -1) do
      delete :destroy, id: @executive
    end

    assert_redirected_to executives_path
  end
end
