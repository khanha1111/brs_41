class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships, through: :active_relationships, source: :followed
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  before_save {self.email = email.downcase}
  has_secure_password
end
