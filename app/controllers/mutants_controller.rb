class MutantsController < ApplicationController
  before_action :set_mutant, only: [:show, :edit, :update, :destroy]

  respond_to :html
  # GET /mutants
  # GET /mutants.json
  def index
    @mutants = Mutant.all
  end

  # GET /mutants/1
  # GET /mutants/1.json
  def show
  end

  # GET /mutants/new
  def new
    @mutant = Mutant.new
  end

  # GET /mutants/1/edit
  def edit
  end

  # POST /mutants
  # POST /mutants.json
  def create
    @mutant = Mutant.new(mutant_params)

    if @mutant.save
      redirect_to mutants_url, notice: 'Mutant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mutants/1
  # PATCH/PUT /mutants/1.json
  def update
    if @mutant.update(mutant_params)
      redirect_to @mutant, notice: 'Mutant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mutants/1
  # DELETE /mutants/1.json
  def destroy
    @mutant.destroy
    redirect_to mutants_url, notice: 'Mutant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutant
      @mutant = Mutant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mutant_params
      params.require(:mutant).permit(:name)
    end
end
