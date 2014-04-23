# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

  authenticates_with_sorcery!
  ROLES=%w(Пользователь Модератор Администратор)
  validates :role, :presence => true, :inclusion => {:in => 0...ROLES.size}
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :username, :uniqueness => true , :presence => true, :length => {:maximum => 100}
  validates :password, :presence => true, :length => {:minimum => 6}, :confirmation => true, :on => :create, :if => :present?



  def human_role
    ROLES[role.to_i]
  end

  def user?
    role==0
  end
  def moderator?
    role==1
  end
  def admin?
    role==2
  end

  def privilege?
    moderator? || admin?
  end
end
