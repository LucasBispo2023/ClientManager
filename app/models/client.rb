class Client < ApplicationRecord
  belongs_to :admin
  
  paginates_per 10

  scope :orderByName, -> (page,ord="asc"){
    includes(:admin).all
    .order("first_name #{ord}").page(page)
  }

  scope :orderByLastName, -> (page){
    includes(:admin).all
    .order('last_name').page(page)
  }

  scope :orderByEmail, -> (page){
    includes(:admin).all
    .order('email').page(page)
  }

  scope :orderById, -> (page){
    includes(:admin).all
    .order('id').page(page)
  }

  scope :orderByAddress, -> (page){
    includes(:admin).all
    .order('address').page(page)
  }
  
end
