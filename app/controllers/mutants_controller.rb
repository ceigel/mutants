class MutantsController < ApplicationController
  before_action :set_mutant, only: [:show, :edit, :update, :destroy]

  respond_to :html
  def index
    @mutants = Mutant.all
  end

  def show
  end

  def edit
  end

  def update
    if @mutant.update(mutant_params)
      redirect_to @mutant, notice: 'Mutant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @mutant.destroy
    redirect_to mutants_url, notice: 'Mutant was successfully destroyed.'
  end

  private
    def set_mutant
      @mutant = Mutant.find(params[:id])
    end

    def mutant_params
      params.require(:mutant).permit(:name)
    end
end
