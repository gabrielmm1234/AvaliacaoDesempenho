require 'test_helper'

class EvaluationModelsControllerTest < ActionController::TestCase
  setup do
    @evaluation_model = evaluation_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_model" do
    assert_difference('EvaluationModel.count') do
      post :create, evaluation_model: { name: @evaluation_model.name }
    end

    assert_redirected_to evaluation_model_path(assigns(:evaluation_model))
  end

  test "should show evaluation_model" do
    get :show, id: @evaluation_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation_model
    assert_response :success
  end

  test "should update evaluation_model" do
    patch :update, id: @evaluation_model, evaluation_model: { name: @evaluation_model.name }
    assert_redirected_to evaluation_model_path(assigns(:evaluation_model))
  end

  test "should destroy evaluation_model" do
    assert_difference('EvaluationModel.count', -1) do
      delete :destroy, id: @evaluation_model
    end

    assert_redirected_to evaluation_models_path
  end
end
