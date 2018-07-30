class Wiki < ApplicationRecord
  attr_accessor :slug
  belongs_to :user, required: false
  after_initialize :init
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  private

  def init
    self.private ||= false
  end
end
 
