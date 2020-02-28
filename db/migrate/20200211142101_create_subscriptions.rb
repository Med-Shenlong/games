class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_join_table :games, :users, table_name: 'subscriptions' do |t|


      t.index [:game_id, :user_id]
      t.index [:user_id, :game_id]


    end
  end
end
