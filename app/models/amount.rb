class Amount < ApplicationRecord
  belongs_to :user
  after_create :default

  def default
    100_000
  end
end
