class User < ApplicationRecord
  # Include default devise modules. Others available are:
  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable





  has_many :games, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :subscriptions
  has_many :followed_games, through: :subscriptions, source: :game



  has_secure_password
  has_secure_token :confirmation_token
  has_secure_token :recover_password

  has_image :avatar




  validates :username,
  format: {with: /\A[a-zA-Z0-9_]{2,20}\z/, message: '
must only contain alphanumeric characters with or without underscores'},
  uniqueness: {case_sensitive: false}
  validates :email,
  format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},
  uniqueness: {case_sensitive: false}



def to_session

  {id: id}

end


=begin

attr_accessor  :avatar_file
validates :avatar_file, file: {ext: [:jpg, :png]}
after_save :avatar_after_upload
before_save :avatar_before_upload
after_destroy_commit :avatar_destroy




  def avatar_path

File.join(
    Rails.public_path,
     self.class.name.pluralize,
     id.to_s,
     'avatar.jpg')


  end

  def avatar_url
   '/' + [
   self.class.name.pluralize,
     id.to_s,
     'avatar.jpg'
     ].join('/')

  end


  private

def avatar_before_upload

if avatar_file.respond_to? :path

self.avatar = true

 end
  end



def avatar_after_upload

  path = avatar_path

if avatar_file.respond_to? :path

dir = File.dirname(path)
FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
image = MiniMagick::Image.new(avatar_file.path) do |b|

  b.resize '150x150^'
  b.gravity 'center'
  b.crop  '150x150+0+0'

end

image.format 'jpg'
image.write path


      end
  end


  def avatar_destroy

dir = File.dirname(avatar_path)
FileUtils.rm_r(dir) if Dir.exist?(dir)

  end

=end
end
