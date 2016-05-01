require 'test_helper'

class CanonicalVehiclesControllerTest < ActionController::TestCase
  setup do
    @canonical_vehicle = canonical_vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canonical_vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canonical_vehicle" do
    assert_difference('CanonicalVehicle.count') do
      post :create, canonical_vehicle: { make: @canonical_vehicle.make, model: @canonical_vehicle.model, year: @canonical_vehicle.year }
    end

    assert_redirected_to canonical_vehicle_path(assigns(:canonical_vehicle))
  end

  test "should show canonical_vehicle" do
    get :show, id: @canonical_vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canonical_vehicle
    assert_response :success
  end

  test "should update canonical_vehicle" do
    patch :update, id: @canonical_vehicle, canonical_vehicle: { make: @canonical_vehicle.make, model: @canonical_vehicle.model, year: @canonical_vehicle.year }
    assert_redirected_to canonical_vehicle_path(assigns(:canonical_vehicle))
  end

  test "should destroy canonical_vehicle" do
    assert_difference('CanonicalVehicle.count', -1) do
      delete :destroy, id: @canonical_vehicle
    end

    assert_redirected_to canonical_vehicles_path
  end
end
