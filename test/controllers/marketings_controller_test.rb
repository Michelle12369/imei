require 'test_helper'

class MarketingsControllerTest < ActionController::TestCase
  setup do
    @marketing = marketings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marketings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marketing" do
    assert_difference('Marketing.count') do
      post :create, marketing: { increase: @marketing.increase, p_id: @marketing.p_id, p_name: @marketing.p_name, price: @marketing.price, price_origin: @marketing.price_origin, profit: @marketing.profit, r_inventory: @marketing.r_inventory, retail_id: @marketing.retail_id, valid_date: @marketing.valid_date }
    end

    assert_redirected_to marketing_path(assigns(:marketing))
  end

  test "should show marketing" do
    get :show, id: @marketing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marketing
    assert_response :success
  end

  test "should update marketing" do
    patch :update, id: @marketing, marketing: { increase: @marketing.increase, p_id: @marketing.p_id, p_name: @marketing.p_name, price: @marketing.price, price_origin: @marketing.price_origin, profit: @marketing.profit, r_inventory: @marketing.r_inventory, retail_id: @marketing.retail_id, valid_date: @marketing.valid_date }
    assert_redirected_to marketing_path(assigns(:marketing))
  end

  test "should destroy marketing" do
    assert_difference('Marketing.count', -1) do
      delete :destroy, id: @marketing
    end

    assert_redirected_to marketings_path
  end
end
