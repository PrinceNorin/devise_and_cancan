class Ability
  include CanCan::Ability
  
  def initialize(user)
    return unless user
    
    if user && user.admin?
      can :manage, :all 
    else
      can :read, :all
      can :update, Comment { |comment| comment.user == user }
      can :delete, Comment { |comment| comment.user == user }
    end
  end
end