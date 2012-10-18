require 'json'

class CourseStatesController < ApplicationController
  # GET /course_states
  # GET /course_states.json
  def index
    @course_states = CourseState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_states }
    end
  end

  # GET /course_states/1
  # GET /course_states/1.json
  def show
    @course_state = CourseState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_state }
    end
  end

  # GET /course_states/new
  # GET /course_states/new.json
  def new
    @course_state = CourseState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_state }
    end
  end

  # GET /course_states/1/edit
  def edit
    @course_state = CourseState.find(params[:id])
  end

  # POST /course_states
  # POST /course_states.json
  def create
    @course_state = CourseState.new(params[:course_state])

    respond_to do |format|
      if @course_state.save
        format.html { redirect_to @course_state, notice: 'Course state was successfully created.' }
        format.json { render json: @course_state, status: :created, location: @course_state }
      else
        format.html { render action: "new" }
        format.json { render json: @course_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_states/1
  # PUT /course_states/1.json
  def update
    @course_state = CourseState.find(params[:id])

    respond_to do |format|
      if @course_state.update_attributes(params[:course_state])
        format.html { redirect_to @course_state, notice: 'Course state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_states/1
  # DELETE /course_states/1.json
  def destroy
    @course_state = CourseState.find(params[:id])
    @course_state.destroy

    respond_to do |format|
      format.html { redirect_to course_states_url }
      format.json { head :no_content }
    end
  end

  GetStudentStateByCourseResult = Struct.new(:Result,:CourseState)
  def getstudentstatebycourse
    @user = User.find_by_email(params[:email])
    @course_states = CourseState.where("course_id = ? AND user_id = ?", params[:course_id],@user.id )
    @course_state = @course_states.first 

    respond_to do |format|
      if @course_state
        #format.json { render json: GetStudentStateByCourseResult.new(0,@course_state.to_json(:include => [:lesson_states,:quiz_states]))  }
        format.json { render json: GetStudentStateByCourseResult.new(0,@course_state.as_json(:include => [:lesson_states,:quiz_states]))  }
      else
        format.json { render json: GetStudentStateByCourseResult.new(1,"")  }
      end  
    end
  end  

  SetStudentStateByCourseResult = Struct.new(:resultcode)
#http://127.0.0.1:3000/SetStudentStateByCourse.json?course_id=1&email=test@test.com&course_state=%7B"state":0,"lesson_states":[%7B"lesson_id":1,"state":0%7D,%7B"lesson_id":2,"state":1%7D],"quiz_states":[%7B"quiz_id":3,"state":2%7D]%7D
  def setstudentstatebycourse
    @user = User.find_by_email(params[:email])
    CourseState.where("course_id = ? AND user_id = ?", params[:course_id],@user.id ).destroy_all

    #parsed_json = ActiveSupport::JSON.decode(params[:course_state])
    parsed_json = JSON.parse params[:course_state]
    
    course_state = CourseState.new(course_id: params[:course_id], state: parsed_json["state"],user_id: @user.id,state_saved_time: Time.now)
    course_state.save

    if parsed_json['lesson_states'] 
      parsed_json['lesson_states'].each do |les|
        lessonstate = LessonState.new(course_state_id: course_state.id, lesson_id: les['lesson_id'], state: les['state'])
        lessonstate.save
      end
    end 
    
    if parsed_json['quiz_states'] 
      parsed_json['quiz_states'].each do |qiz|
        quizstate = QuizState.new(course_state_id: course_state.id, quiz_id: qiz['quiz_id'], state: qiz['state'])
        quizstate.save
      end
    end
      
    respond_to do |format|
        format.json { render json: SetStudentStateByCourseResult.new(0), status: :created }
    end

  end


end
