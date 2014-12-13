class User < ActiveRecord::Base
  attr_accessor :name

  validates :name, presence: true, uniqueness: true

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  def forget
    update_attribute(:remember_digest, nil)
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def user_params
      params.require(:user).permit(:name)
  end

end
