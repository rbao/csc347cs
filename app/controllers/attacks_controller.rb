class AttacksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_attack, only: [:show, :edit, :update, :destroy]

  # GET /attacks
  # GET /attacks.json
  def index
    @attacks = Attack.all
  end

  # GET /attacks/1
  # GET /attacks/1.json
  def show
  end

  # GET /attacks/new
  def new
    @attack = Attack.new
  end

  # GET /attacks/1/edit
  def edit
  end

  # POST /attacks
  # POST /attacks.json
  def create
    @attack = Attack.new(attack_params)

    respond_to do |format|
      if @attack.save
        format.html { redirect_to @attack, notice: 'Attack was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attack }
      else
        format.html { render action: 'new' }
        format.json { render json: @attack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attacks/1
  # PATCH/PUT /attacks/1.json
  def update
    respond_to do |format|
      if @attack.update(attack_params)
        format.html { redirect_to @attack, notice: 'Attack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attacks/1
  # DELETE /attacks/1.json
  def destroy
    @attack.destroy
    respond_to do |format|
      format.html { redirect_to attacks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attack
      @attack = Attack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attack_params
      params.require(:attack).permit(:vector, :ip)
    end
end
