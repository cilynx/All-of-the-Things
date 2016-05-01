require 'test_helper'

class PerformedMaintenancePartsControllerTest < ActionController::TestCase
  setup do
    @performed_maintenance_part = performed_maintenance_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performed_maintenance_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performed_maintenance_part" do
    assert_difference('PerformedMaintenancePart.count') do
      post :create, performed_maintenance_part: { cost: @performed_maintenance_part.cost, part_id: @performed_maintenance_part.part_id, performed_maintenance_id: @performed_maintenance_part.performed_maintenance_id }
    end

    assert_redirected_to performed_maintenance_part_path(assigns(:performed_maintenance_part))
  end

  test "should show performed_maintenance_part" do
    get :show, id: @performed_maintenance_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performed_maintenance_part
    assert_response :success
  end

  test "should update performed_maintenance_part" do
    patch :update, id: @performed_maintenance_part, performed_maintenance_part: { cost: @performed_maintenance_part.cost, part_id: @performed_maintenance_part.part_id, performed_maintenance_id: @performed_maintenance_part.performed_maintenance_id }
    assert_redirected_to performed_maintenance_part_path(assigns(:performed_maintenance_part))
  end

  test "should destroy performed_maintenance_part" do
    assert_difference('PerformedMaintenancePart.count', -1) do
      delete :destroy, id: @performed_maintenance_part
    end

    assert_redirected_to performed_maintenance_parts_path
  end
end
