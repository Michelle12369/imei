require 'test_helper'

class RetailinformsControllerTest < ActionController::TestCase
  setup do
    @retailinform = retailinforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retailinforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retailinform" do
    assert_difference('Retailinform.count') do
      post :create, retailinform: { book_cost: @retailinform.book_cost, cost: @retailinform.cost, eoq: @retailinform.eoq, hold_cost: @retailinform.hold_cost, max_demand: @retailinform.max_demand, min_demand: @retailinform.min_demand, p_id: @retailinform.p_id, price: @retailinform.price, r_inventory: @retailinform.r_inventory, rop: @retailinform.rop }
    end

    assert_redirected_to retailinform_path(assigns(:retailinform))
  end

  test "should show retailinform" do
    get :show, id: @retailinform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retailinform
    assert_response :success
  end

  test "should update retailinform" do
    patch :update, id: @retailinform, retailinform: { book_cost: @retailinform.book_cost, cost: @retailinform.cost, eoq: @retailinform.eoq, hold_cost: @retailinform.hold_cost, max_demand: @retailinform.max_demand, min_demand: @retailinform.min_demand, p_id: @retailinform.p_id, price: @retailinform.price, r_inventory: @retailinform.r_inventory, rop: @retailinform.rop }
    assert_redirected_to retailinform_path(assigns(:retailinform))
  end

  test "should destroy retailinform" do
    assert_difference('Retailinform.count', -1) do
      delete :destroy, id: @retailinform
    end

    assert_redirected_to retailinforms_path
  end
end
