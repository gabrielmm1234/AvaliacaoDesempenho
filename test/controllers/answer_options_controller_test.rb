require 'test_helper'

class AnswerOptionsControllerTest < ActionController::TestCase
  setup do
    @answer_option = answer_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer_option" do
    assert_difference('AnswerOption.count') do
      post :create, answer_option: { description: @answer_option.description, option: @answer_option.option, question_id: @answer_option.question_id }
    end

    assert_redirected_to answer_option_path(assigns(:answer_option))
  end

  test "should show answer_option" do
    get :show, id: @answer_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answer_option
    assert_response :success
  end

  test "should update answer_option" do
    patch :update, id: @answer_option, answer_option: { description: @answer_option.description, option: @answer_option.option, question_id: @answer_option.question_id }
    assert_redirected_to answer_option_path(assigns(:answer_option))
  end

  test "should destroy answer_option" do
    assert_difference('AnswerOption.count', -1) do
      delete :destroy, id: @answer_option
    end

    assert_redirected_to answer_options_path
  end
end
