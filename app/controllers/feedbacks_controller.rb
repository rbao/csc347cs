class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new
    if !params[:qa2ws3ed].blank?
      flash[:notice] = "You are a bot! Stop it"
      render action: 'new'
      return
    end
    
    @feedback.name = params[:name]
    @feedback.email = params[:email]
    @feedback.phone = params[:phone]
    @feedback.description = params[:description]

    sql_inj = contains_sql_metachar?(@feedback.email)

    
    if sql_inj
      # If this looks like an attack we record it and use a different
      # database, in this case the model InjectedFeedback is connected
      # to the dummy database
      injected_feedback = InjectedFeedback.new
      injected_feedback.name = @feedback.name
      injected_feedback.email = @feedback.email
      injected_feedback.phone = @feedback.phone
      injected_feedback.description = @feedback.description
      
      attack = Attack.new
      attack.vector = @feedback.email
      attack.ip = request.remote_ip
      attack.save

      db_error = injected_feedback.injected_save

      render action: 'new'
    else

      respond_to do |format|
        if @feedback.save

          format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
          format.json { render action: 'show', status: :created, location: @feedback }
        else
          format.html { render action: 'new' }
          format.json { render json: @feedback.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :no_content }
    end
  end

  private
    def contains_sql_metachar?(input)
      res = [/(')|(\-\-)/]
      res.each do |re|
        return true if !re.match(input).nil?
      end
      return false
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end
end
