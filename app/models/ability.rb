class Ability

  include CanCan::Ability

  def initialize(user)
    # Ruby style!
  	unless user.nil?
	    if user.admin?
	      can :manage, :all
	    else
	      can :read,Evaluation,:usuario_avaliador_id => user.id
	    end
	  end
  end

end
