require 'test_helper'

class PerformedMaintenancesControllerTest < ActionController::TestCase
  setup do
    @performed_maintenance = performed_maintenances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performed_maintenances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performed_maintenance" do
    assert_difference('PerformedMaintenance.count') do
      post :create, performed_maintenance: { maintenance_id: @performed_maintenance.maintenance_id, service_id: @performed_maintenance.service_id }
    end

    assert_redirected_to performed_maintenance_path(assigns(:performed_maintenance))
  end

  test "should show performed_maintenance" do
    get :show, id: @performed_maintenance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performed_maintenance
    assert_response :success
  end

  test "should update performed_maintenance" do
    patch :update, id: @performed_maintenance, performed_maintenance: { maintenance_id: @performed_maintenance.maintenance_id, service_id: @performed_maintenance.service_id }
    assert_redirected_to performed_maintenance_path(assigns(:performed_maintenance))
  end

  test "should destroy performed_maintenance" do
    assert_difference('PerformedMaintenance.count', -1) do
      delete :destroy, id: @performed_maintenance
    end

    assert_redirected_to performed_maintenances_path
  end
end
