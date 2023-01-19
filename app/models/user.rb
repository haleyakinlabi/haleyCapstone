# frozen_string_literal: true

class User < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................

  # relationships .............................................................
  has_many :posts
  has_many :follower_connections, class_name: "UserConnection", foreign_key: "leader_id"
  has_many :leader_connections, class_name: "UserConnection", foreign_key: "follower_id"
  has_many :followers, through: :follower_connections, source: "follower"
  has_many :leaders, through: :leader_connections, source: "leader"
  has_one_attached :image

  # validations ...............................................................
  validates :username, presence: true, uniqueness: true
  validates :email, email: true, uniqueness: true
  validates :species, presence: true

  # callbacks .................................................................
  before_validation :standardize_username
  before_validation :standardize_email
  before_validation :standardize_species
  before_validation :standardize_breed
  before_save :ensure_avatar_url

  # scopes ....................................................................

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  accepts_nested_attributes_for :leaders
  has_secure_password

  # class methods .............................................................
  class << self
  end

  # public instance methods ...................................................

  # protected instance methods ................................................

  # private instance methods ..................................................

  private

  def standardize_username
    self.username = username.to_s.downcase.strip
  end

  def standardize_email
    self.email = email.to_s.downcase.strip
  end

  def standardize_species
    self.species = species.to_s.downcase.parameterize.strip
  end

  def standardize_breed
    self.breed = breed.to_s.downcase.parameterize.strip
  end

  def ensure_avatar_url
    self.avatar_url = "https://placedog.net/50/50?random=#{SecureRandom.urlsafe_base64}" if avatar_url.blank?
  end
end
