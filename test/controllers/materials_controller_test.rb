require 'test_helper'

class MaterialsControllerTest < ActionController::TestCase
  setup do
    @material = materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post :create, material: { condition: @material.condition, m_cost: @material.m_cost, m_id: @material.m_id, m_name: @material.m_name, number: @material.number, quality: @material.quality, result: @material.result, s_address: @material.s_address, s_phone: @material.s_phone, supplier: @material.supplier, transportation_time: @material.transportation_time }
    end

    assert_redirected_to material_path(assigns(:material))
  end

  test "should show material" do
    get :show, id: @material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material
    assert_response :success
  end

  test "should update material" do
    patch :update, id: @material, material: { condition: @material.condition, m_cost: @material.m_cost, m_id: @material.m_id, m_name: @material.m_name, number: @material.number, quality: @material.quality, result: @material.result, s_address: @material.s_address, s_phone: @material.s_phone, supplier: @material.supplier, transportation_time: @material.transportation_time }
    assert_redirected_to material_path(assigns(:material))
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete :destroy, id: @material
    end

    assert_redirected_to materials_path
  end
end
