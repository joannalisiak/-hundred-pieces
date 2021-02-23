class LegoPolicy < ApplicationPolicy

  def show?
    true
  end
  
  def create?
    true
  end

  def update?
    record.user == user || user.admin
  end

  def destroy?
    record.user == user || user.admin
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
