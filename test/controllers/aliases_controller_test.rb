require 'test_helper'

class AliasesControllerTest < ActionController::TestCase
  setup do
    @alias = aliases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aliases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alias" do
    assert_difference('Alias.count') do
      post :create, alias: { memo: @alias.memo, payee: @alias.payee, vendor_id: @alias.vendor_id }
    end

    assert_redirected_to alias_path(assigns(:alias))
  end

  test "should show alias" do
    get :show, id: @alias
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alias
    assert_response :success
  end

  test "should update alias" do
    patch :update, id: @alias, alias: { memo: @alias.memo, payee: @alias.payee, vendor_id: @alias.vendor_id }
    assert_redirected_to alias_path(assigns(:alias))
  end

  test "should destroy alias" do
    assert_difference('Alias.count', -1) do
      delete :destroy, id: @alias
    end

    assert_redirected_to aliases_path
  end
end
