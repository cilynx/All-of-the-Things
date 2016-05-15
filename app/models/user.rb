class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  groupify :named_group_member

  has_many :vehicles
  has_many :services, through: :vehicles
  has_many :fillups, through: :vehicles
  has_many :performed_maintenances, through: :vehicles
  has_many :performed_maintenance_parts, through: :performed_maintenances

  has_many :accounts
  has_many :transactions, through: :accounts

  has_many :houses

  has_many :tasks

  def to_s
    return self.email
  end
end
