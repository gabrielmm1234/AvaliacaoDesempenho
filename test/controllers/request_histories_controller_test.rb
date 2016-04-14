require 'test_helper'

class RequestHistoriesControllerTest < ActionController::TestCase
  setup do
    @request_history = request_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_history" do
    assert_difference('RequestHistory.count') do
      post :create, request_history: { approved: @request_history.approved, email: @request_history.email, name: @request_history.name, profile_id: @request_history.profile_id }
    end

    assert_redirected_to request_history_path(assigns(:request_history))
  end

  test "should show request_history" do
    get :show, id: @request_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_history
    assert_response :success
  end

  test "should update request_history" do
    patch :update, id: @request_history, request_history: { approved: @request_history.approved, email: @request_history.email, name: @request_history.name, profile_id: @request_history.profile_id }
    assert_redirected_to request_history_path(assigns(:request_history))
  end

  test "should destroy request_history" do
    assert_difference('RequestHistory.count', -1) do
      delete :destroy, id: @request_history
    end

    assert_redirected_to request_histories_path
  end
end
