class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :init_role
  has_many :wikis, dependent: :destroy

  enum role: [:standard, :premium, :admin]

  private

  def init_role 
   self.role ||= :standard
  end
end
