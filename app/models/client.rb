class Client < ApplicationRecord
  belongs_to :admin
   
  #validations
  validates :first_name, presence: true, length: {minimum: 3}
  validates :last_name, presence: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :zip_code, presence: true, length: {is: 9}
  validates :telephone, presence: true, length: {is: 14}

  paginates_per 5

  scope :orderByName, -> (page,field){
    includes(:admin).all
    .order(field).page(page)
  }
  
end
