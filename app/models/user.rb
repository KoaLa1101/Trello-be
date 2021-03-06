class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_many :todos, dependent: :destroy
  has_many :cards, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Возвращает дайджест данной строки
  def User.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
  BCrypt::Engine::MIN_COST
else
  BCrypt::Engine.cost
end
    BCrypt::Password.create(string, cost: cost)
  end

  # Возвращает случайный токен
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Запоминает пользователя в базе данных для использования в постоянной сессии.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Забывает пользователя
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Возвращает true, если предоставленный токен совпадает с дайджестом.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end