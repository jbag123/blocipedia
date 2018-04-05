class Wiki < ApplicationRecord
  belongs_to :user, required: false
  after_initialize :init

  private

  def init
    self.private ||= false
  end
end
 
