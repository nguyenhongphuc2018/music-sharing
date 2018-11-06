class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :image, as: :imageable
  has_many :categories
  has_many :songs
  has_many :albums
  has_many :authors
  has_many :singers
  has_many :lyrics
  has_many :likes
  has_many :comments
  has_many :reports

  validates :name, presence: true, length:
    {maximum: Settings.validates.name.maximum}
  validates :email, presence: true, length:
    {maximum: Settings.validates.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length:
    {minimum: Settings.validates.password.minimum}, allow_nil: true

  attr_accessor :remember_token
  has_secure_password
  before_save :downcase_email

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def forget
    update_attributes remember_digest: User.digest(remember_token)
  end

  class << self
    def digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private

  def downcase_email
    email.downcase!
  end
end
