class BookingPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    record.costume.user != user
  end

  def edit?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def approve?
    record.costume.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
