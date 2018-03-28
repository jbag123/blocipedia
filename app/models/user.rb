class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :init
  validate :payment, on: :create

  private

  def payment

  end

  def init
   self.role ||= :standard
  end

  enum role: [:standard, :premium, :admin]
end
