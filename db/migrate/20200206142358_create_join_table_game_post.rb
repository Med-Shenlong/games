class CreateJoinTableGamePost < ActiveRecord::Migration[6.0]
  def change
    create_join_table :games, :posts do |t|
       t.index [:game_id, :post_id]
       t.index [:post_id, :game_id]
    end
  end
end
