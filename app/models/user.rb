class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  groupify :named_group_member

  has_many :vehicles
  has_many :accounts
  has_many :transactions, through: :accounts
end
