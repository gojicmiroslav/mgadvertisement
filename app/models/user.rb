class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :firstname,  presence: true, length: { maximum: 100 }    
  validates :lastname,  presence: true, length: { maximum: 100 }
end
