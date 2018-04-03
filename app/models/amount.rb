class Amount < ApplicationRecord
  belongs_to :user
  def default
    100_000
  end
end
