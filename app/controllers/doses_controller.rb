class DosesController < ApplicationController

  before_action :set_cocktail, only: [:new, :create, :delete]

  def new
    @dose = Dose.new
  end

  def create
    @dose= Dose.new(dose_params)
    # we need `restaurant_id` to associate comment with corresponding restaurant
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @doses = @cocktail.doses

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully destroyed.'
    end
  end

  private

  def set_cocktail
     @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient, :description)
  end
end


