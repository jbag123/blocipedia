class Wiki < ApplicationRecord
  after_initialize :init
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  private

  def init
    self.private ||= false
  end
end
