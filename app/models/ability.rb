class Ability

  include CanCan::Ability

  def initialize(user)
    # Ruby style!
  	unless user.nil?
	    if user.admin?
	      can :manage, :all
	    else
	      # Por enquanto usuário comum não faz nada
	      # Ele so tem permissão para responder questionário.
	    end
	  end
  end

end
