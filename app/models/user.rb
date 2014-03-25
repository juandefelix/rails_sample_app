class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy  # the microposts will be destoyed when the user is destroyed
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, 
                    format:     { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64           # Generates a token
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)    # Hashes a token
  end

  def feed
    Micropost.where("user_id = ?", id)
  end
  
  private

    # Assigns a generated and hashed token to the User.remember_token
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token) 
    end  
end
