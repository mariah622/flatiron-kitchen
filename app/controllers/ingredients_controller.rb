class IngredientsController < ApplicationController
    before_action :get_ingredient, except: [:index, :new, :create]
  
    def index
      @ingredients = Ingredient.all
    end
  
    def new
      @ingredient = Ingredient.new 
    end
  
    def create
      @ingredient = Ingredient.create(ingredient_params)
      redirect_to ingredient_path(@ingredient)
      # binding.pry
      # if ingredient.valid?
      #   ingredient.save
      #   redirect_to ingredient_path(ingredient)
      # else
      #   render :new 
      # end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @ingredient = Ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    end
  
    def destroy
    end
  
  private 
  
  def get_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end
  
  def ingredient_params 
    params.require(:ingredient).permit(:name)  
  end
  
end