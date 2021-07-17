class RecipesController < ApplicationController
    before_action :get_recipe, except: [:index, :new, :create]
  
    def index
      @recipes = Recipe.all
    end
  
    def new
      @recipe = Recipe.new 
    end
  
    def create
      @recipe = Recipe.create(recipe_params)
      redirect_to recipe_path(@recipe)
      # if @recipe.valid?
      #   @recipe.save
      #   redirect_to recipe_path(recipe)
      # else
      #   render :new
      # end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    end
  
    def destroy
    end
  
  private 
  
  def get_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end 
  
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredient_attributes: [:name])
  end
  
end