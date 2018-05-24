class IngredientsController < ApplicationController
  before_action :set_ingred, only: [:show, :edit, :update, :destroy]

  def index
    require_logged_in
  end

  def show
    require_logged_in
    set_ingred
  end

  def new
    require_logged_in
    @ingred = Ingredient.new
  end

  def create
    @ingred = Ingredient.new(ingred_params)
    if @ingred.save
      current_user.ingredients << @ingred
      redirect_to @ingred, notice: "Ingredient was added to your pantry!"
    else
      flash.now[:notice] = "Oopsies, try that again!"
      render :new
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to ingredients_path
  end

  private

  def set_ingred
    @ingred = Ingredient.find(params[:id])
  end

  def ingred_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
