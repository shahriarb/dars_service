require 'test_helper'

class CourseStatesControllerTest < ActionController::TestCase
  setup do
    @course_state = course_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_state" do
    assert_difference('CourseState.count') do
      post :create, course_state: { course_id: @course_state.course_id, state: @course_state.state, user_id: @course_state.user_id }
    end

    assert_redirected_to course_state_path(assigns(:course_state))
  end

  test "should show course_state" do
    get :show, id: @course_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_state
    assert_response :success
  end

  test "should update course_state" do
    put :update, id: @course_state, course_state: { course_id: @course_state.course_id, state: @course_state.state, user_id: @course_state.user_id }
    assert_redirected_to course_state_path(assigns(:course_state))
  end

  test "should destroy course_state" do
    assert_difference('CourseState.count', -1) do
      delete :destroy, id: @course_state
    end

    assert_redirected_to course_states_path
  end
end
