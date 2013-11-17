require 'test_helper'

class CausesControllerTest < ActionController::TestCase
  setup do
    @cause = causes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:causes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cause" do
    assert_difference('Cause.count') do
      post :create, cause: { categoryID: @cause.categoryID, city: @cause.city, contactEmail: @cause.contactEmail, contactPhone: @cause.contactPhone, executiveID: @cause.executiveID, missionDescription: @cause.missionDescription, monthlySponsorship: @cause.monthlySponsorship, name: @cause.name, state: @cause.state, taxID: @cause.taxID, zip: @cause.zip }
    end

    assert_redirected_to cause_path(assigns(:cause))
  end

  test "should show cause" do
    get :show, id: @cause
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cause
    assert_response :success
  end

  test "should update cause" do
    patch :update, id: @cause, cause: { categoryID: @cause.categoryID, city: @cause.city, contactEmail: @cause.contactEmail, contactPhone: @cause.contactPhone, executiveID: @cause.executiveID, missionDescription: @cause.missionDescription, monthlySponsorship: @cause.monthlySponsorship, name: @cause.name, state: @cause.state, taxID: @cause.taxID, zip: @cause.zip }
    assert_redirected_to cause_path(assigns(:cause))
  end

  test "should destroy cause" do
    assert_difference('Cause.count', -1) do
      delete :destroy, id: @cause
    end

    assert_redirected_to causes_path
  end
end
