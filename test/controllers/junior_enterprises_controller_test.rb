require 'test_helper'

class JuniorEnterprisesControllerTest < ActionController::TestCase
  setup do
    @junior_enterprise = junior_enterprises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:junior_enterprises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create junior_enterprise" do
    assert_difference('JuniorEnterprise.count') do
      post :create, junior_enterprise: { name: @junior_enterprise.name }
    end

    assert_redirected_to junior_enterprise_path(assigns(:junior_enterprise))
  end

  test "should show junior_enterprise" do
    get :show, id: @junior_enterprise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @junior_enterprise
    assert_response :success
  end

  test "should update junior_enterprise" do
    patch :update, id: @junior_enterprise, junior_enterprise: { name: @junior_enterprise.name }
    assert_redirected_to junior_enterprise_path(assigns(:junior_enterprise))
  end

  test "should destroy junior_enterprise" do
    assert_difference('JuniorEnterprise.count', -1) do
      delete :destroy, id: @junior_enterprise
    end

    assert_redirected_to junior_enterprises_path
  end
end
