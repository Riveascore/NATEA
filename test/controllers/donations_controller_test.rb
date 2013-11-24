require 'test_helper'

class DonationsControllerTest < ActionController::TestCase
  setup do
    @donation = donations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation" do
    assert_difference('Donation.count') do
      post :create, donation: { donation_amount: @donation.donation_amount, donation_date: @donation.donation_date, donator_id: @donation.donator_id, payment_method_id: @donation.payment_method_id, recurring: @donation.recurring, recurring_period_months: @donation.recurring_period_months }
    end

    assert_redirected_to donation_path(assigns(:donation))
  end

  test "should show donation" do
    get :show, id: @donation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation
    assert_response :success
  end

  test "should update donation" do
    patch :update, id: @donation, donation: { donation_amount: @donation.donation_amount, donation_date: @donation.donation_date, donator_id: @donation.donator_id, payment_method_id: @donation.payment_method_id, recurring: @donation.recurring, recurring_period_months: @donation.recurring_period_months }
    assert_redirected_to donation_path(assigns(:donation))
  end

  test "should destroy donation" do
    assert_difference('Donation.count', -1) do
      delete :destroy, id: @donation
    end

    assert_redirected_to donations_path
  end
end
