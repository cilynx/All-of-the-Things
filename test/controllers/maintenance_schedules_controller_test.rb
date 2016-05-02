require 'test_helper'

class MaintenanceSchedulesControllerTest < ActionController::TestCase
  setup do
    @maintenance_schedule = maintenance_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenance_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance_schedule" do
    assert_difference('MaintenanceSchedule.count') do
      post :create, maintenance_schedule: {  }
    end

    assert_redirected_to maintenance_schedule_path(assigns(:maintenance_schedule))
  end

  test "should show maintenance_schedule" do
    get :show, id: @maintenance_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenance_schedule
    assert_response :success
  end

  test "should update maintenance_schedule" do
    patch :update, id: @maintenance_schedule, maintenance_schedule: {  }
    assert_redirected_to maintenance_schedule_path(assigns(:maintenance_schedule))
  end

  test "should destroy maintenance_schedule" do
    assert_difference('MaintenanceSchedule.count', -1) do
      delete :destroy, id: @maintenance_schedule
    end

    assert_redirected_to maintenance_schedules_path
  end
end
