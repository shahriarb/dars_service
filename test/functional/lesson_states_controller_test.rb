require 'test_helper'

class LessonStatesControllerTest < ActionController::TestCase
  setup do
    @lesson_state = lesson_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lesson_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lesson_state" do
    assert_difference('LessonState.count') do
      post :create, lesson_state: { course_state_id: @lesson_state.course_state_id, state: @lesson_state.state }
    end

    assert_redirected_to lesson_state_path(assigns(:lesson_state))
  end

  test "should show lesson_state" do
    get :show, id: @lesson_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lesson_state
    assert_response :success
  end

  test "should update lesson_state" do
    put :update, id: @lesson_state, lesson_state: { course_state_id: @lesson_state.course_state_id, state: @lesson_state.state }
    assert_redirected_to lesson_state_path(assigns(:lesson_state))
  end

  test "should destroy lesson_state" do
    assert_difference('LessonState.count', -1) do
      delete :destroy, id: @lesson_state
    end

    assert_redirected_to lesson_states_path
  end
end
