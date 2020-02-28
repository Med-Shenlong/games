class SubscriptionsController < ApplicationController




  before_action do


    @game = Game.find(params[:game_id])

  end



  def create


    @game.subscribers << current_user


    redirect_to @game, success: 'You Are now Subscribed to ' + @game.title



end


def destroy

@game.subscribers.delete(current_user)


    redirect_to @game, success: 'You Are now Unsubscribed to ' + @game.title


  end

end
