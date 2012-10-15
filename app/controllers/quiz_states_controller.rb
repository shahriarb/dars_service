class QuizStatesController < ApplicationController
  # GET /quiz_states
  # GET /quiz_states.json
  def index
    @quiz_states = QuizState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quiz_states }
    end
  end

  # GET /quiz_states/1
  # GET /quiz_states/1.json
  def show
    @quiz_state = QuizState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz_state }
    end
  end

  # GET /quiz_states/new
  # GET /quiz_states/new.json
  def new
    @quiz_state = QuizState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz_state }
    end
  end

  # GET /quiz_states/1/edit
  def edit
    @quiz_state = QuizState.find(params[:id])
  end

  # POST /quiz_states
  # POST /quiz_states.json
  def create
    @quiz_state = QuizState.new(params[:quiz_state])

    respond_to do |format|
      if @quiz_state.save
        format.html { redirect_to @quiz_state, notice: 'Quiz state was successfully created.' }
        format.json { render json: @quiz_state, status: :created, location: @quiz_state }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quiz_states/1
  # PUT /quiz_states/1.json
  def update
    @quiz_state = QuizState.find(params[:id])

    respond_to do |format|
      if @quiz_state.update_attributes(params[:quiz_state])
        format.html { redirect_to @quiz_state, notice: 'Quiz state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_states/1
  # DELETE /quiz_states/1.json
  def destroy
    @quiz_state = QuizState.find(params[:id])
    @quiz_state.destroy

    respond_to do |format|
      format.html { redirect_to quiz_states_url }
      format.json { head :no_content }
    end
  end
end
