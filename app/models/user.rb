class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :payments
  has_many :addresses
  has_many :notifications
  has_many :likes

  validates :nickname, presence: true
  validates :nickname, uniqueness: true
  validates :family_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
end
