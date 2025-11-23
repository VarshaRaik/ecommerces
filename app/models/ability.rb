class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    case user.role.role_name
    when "admin"
      can :manage, :all               
    when "seller"
      can :read, Product
      can :create, Product
      can :update, Product, user_id: user.id 
      can :destroy, Product, user_id: user.id
      can :read, Order                 
    when "buyer"
      can :read, Product              
      can :manage, Cart
      can :manage, Order, user_id: user.id
      can :manage, Address, user_id: user.id
    else
      can :read, Product              
    end
  end
end
