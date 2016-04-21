require 'test_helper'

class EvaluationFactorsControllerTest < ActionController::TestCase
  setup do
    @evaluation_factor = evaluation_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_factor" do
    assert_difference('EvaluationFactor.count') do
      post :create, evaluation_factor: { name: @evaluation_factor.name }
    end

    assert_redirected_to evaluation_factor_path(assigns(:evaluation_factor))
  end

  test "should show evaluation_factor" do
    get :show, id: @evaluation_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation_factor
    assert_response :success
  end

  test "should update evaluation_factor" do
    patch :update, id: @evaluation_factor, evaluation_factor: { name: @evaluation_factor.name }
    assert_redirected_to evaluation_factor_path(assigns(:evaluation_factor))
  end

  test "should destroy evaluation_factor" do
    assert_difference('EvaluationFactor.count', -1) do
      delete :destroy, id: @evaluation_factor
    end

    assert_redirected_to evaluation_factors_path
  end
end
