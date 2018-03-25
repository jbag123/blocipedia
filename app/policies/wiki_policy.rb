class WikiPolicy < ApplicationPolicy
  def index?
    true
  end
  def show?
    user.present?
  end
  def edit?
    user.present?
  end
  def new?
    user.present?
  end
  def update?
    user.present?
  end
  def create?
    user.present?
  end
  def delete?
    return true if user.present? && user == article.user
  end
end
