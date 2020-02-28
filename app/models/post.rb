class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :games


  has_image :image, resize: '940x530', formats: {

    thumb: '360x220'
  }


  validates :name, :content, :game_ids, presence: true
  validates :image_file, presence: true, on: :create
end
