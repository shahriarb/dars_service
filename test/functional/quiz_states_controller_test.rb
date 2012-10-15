require 'test_helper'

class QuizStatesControllerTest < ActionController::TestCase
  setup do
    @quiz_state = quiz_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_state" do
    assert_difference('QuizState.count') do
      post :create, quiz_state: { course_state_id: @quiz_state.course_state_id, state: @quiz_state.state }
    end

    assert_redirected_to quiz_state_path(assigns(:quiz_state))
  end

  test "should show quiz_state" do
    get :show, id: @quiz_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz_state
    assert_response :success
  end

  test "should update quiz_state" do
    put :update, id: @quiz_state, quiz_state: { course_state_id: @quiz_state.course_state_id, state: @quiz_state.state }
    assert_redirected_to quiz_state_path(assigns(:quiz_state))
  end

  test "should destroy quiz_state" do
    assert_difference('QuizState.count', -1) do
      delete :destroy, id: @quiz_state
    end

    assert_redirected_to quiz_states_path
  end
end
