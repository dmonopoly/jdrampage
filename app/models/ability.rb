class Ability
  include CanCan::Ability

  def initialize(user)
		if user.role == "superadmin"
			can :manage, :all
		elsif user.role == "admin"
			can :manage, :all
			cannot :manage, User, :role => 'superadmin'
			# temporary: cannot sort articles. You currently have an ad hoc solution: hide functionality in views
		elsif user.role == "moderator"
			can :manage, [FreeSpace, Article, Page]
			# temporary: cannot sort articles. You currently have an ad hoc solution: hide functionality in views
			can :read, User
			can :update, User, :id => user.id
			can :read, Section
		else # user is a poster
			can :manage, Article # but cannot sort articles. You currently have an ad hoc solution: hide functionality in views
			cannot :destroy, Article
			can :read, User
			can :update, User, :id => user.id
			can :read, Section
		end
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

