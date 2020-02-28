module Admin


  class CategoriesController < ApplicationController

before_action :set_categories, only: [:update, :edit, :destroy]


def index

@categories = Category.all

end


def new

@categories = Category.new

  end



  def create

  @categories = Category.new(categories_params)

   if @categories.save

    redirect_to({action: :index}, success: "Your Category Has Been Added")

   else

    render :new

  end

  end


  def edit
end


def update


   if @categories.update(categories_params)

    redirect_to({action: :index}, success: "Your Category Has Been Updated")

   else

    render :new

  end

end


def destroy

@categories.destroy


    redirect_to({action: :index}, success: "Your Category Has Been Deleted")


end

private


def categories_params

  params.require(:category).permit(:slug, :name)

end

def set_categories


@categories = Category.find(params[:id])

end

end

end
