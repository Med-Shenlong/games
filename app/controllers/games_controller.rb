class GamesController < ApplicationController


 before_action :set_game, only: [:edit, :update, :destroy]
 skip_before_action :only_signed_in, only: [:show]

def index

 @games = current_user.games

end

def show

@game = Game.find(params[:id])

end


def new

@game  = current_user.games.new

  end

  def create

  @game = current_user.games.new(game_params)

  if @game.save
    redirect_to games_path, success: 'thank you for sharing with us your passion for video games'
  else
    render :new
  end
end

def edit

end

def update

 if @game.update(game_params)
redirect_to games_path, success: 'Your Favorite game has been updated'

else

  render :edit

 end

  end


  def destroy


 @game.destroy

redirect_to games_path, success: 'Your Favorite game has been deleted'

  end

  private


  def game_params

   params.require(:game).permit(:title, :test, :release_date, :category_id, :avatar_file)

  end


  def set_game

  @game = current_user.games.find(params[:id])

  end

end
