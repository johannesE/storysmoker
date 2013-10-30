class User < ActiveRecord::Base
  has_many :authentications
 authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true


devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :trackable, :validatable


attr_accessible :email, :password, :password_confirmation


end


