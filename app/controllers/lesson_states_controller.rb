class LessonStatesController < ApplicationController
  # GET /lesson_states
  # GET /lesson_states.json
  def index
    @lesson_states = LessonState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lesson_states }
    end
  end

  # GET /lesson_states/1
  # GET /lesson_states/1.json
  def show
    @lesson_state = LessonState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson_state }
    end
  end

  # GET /lesson_states/new
  # GET /lesson_states/new.json
  def new
    @lesson_state = LessonState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson_state }
    end
  end

  # GET /lesson_states/1/edit
  def edit
    @lesson_state = LessonState.find(params[:id])
  end

  # POST /lesson_states
  # POST /lesson_states.json
  def create
    @lesson_state = LessonState.new(params[:lesson_state])

    respond_to do |format|
      if @lesson_state.save
        format.html { redirect_to @lesson_state, notice: 'Lesson state was successfully created.' }
        format.json { render json: @lesson_state, status: :created, location: @lesson_state }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lesson_states/1
  # PUT /lesson_states/1.json
  def update
    @lesson_state = LessonState.find(params[:id])

    respond_to do |format|
      if @lesson_state.update_attributes(params[:lesson_state])
        format.html { redirect_to @lesson_state, notice: 'Lesson state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_states/1
  # DELETE /lesson_states/1.json
  def destroy
    @lesson_state = LessonState.find(params[:id])
    @lesson_state.destroy

    respond_to do |format|
      format.html { redirect_to lesson_states_url }
      format.json { head :no_content }
    end
  end
end
