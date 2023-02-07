class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :clients


  private
  
  def reset_password_token_present?
    !!$global_params[:admin][:reset_password_token]
  end

    
end
