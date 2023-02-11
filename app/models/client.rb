class Client < ApplicationRecord
   
  #validations
  validates :first_name, presence: true, length: {minimum: 3}
  validates :last_name, presence: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :zip_code, presence: true, length: {is: 9}
  validates :telephone, presence: true, length: {is: 15}

  paginates_per 5

  scope :orderByName, -> (page,field){
    all.order(field).page(page)
  }
  
end
