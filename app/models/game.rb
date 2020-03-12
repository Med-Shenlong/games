class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user




validates :title, :test , :release_date, presence: true
validates :avatar_file, presence: true, on: :create
validate :release_date_not_future


has_image :avatar
has_and_belongs_to_many :posts


  after_destroy :destroy_posts


def release_date_not_future

  if release_date.present? && release_date.future?
    errors.add(:release_date,'you cannot give your opinion on a game that has not yet been released')
  end
end


def followedBy?(user)

  subscriptions.where(user_id: user.id).count > 0 if user.respond_to? :id

  end



private

def destroy_posts

   Post.find_by_sql('SELECT * FROM posts LEFT JOIN games_posts ON games_posts.post_id = posts.id WHERE games_posts.post_id IS NULL').each do |post|

   post.destroy

     end
    end

end

