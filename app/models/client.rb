class Client < ApplicationRecord
  belongs_to :admin
  
  paginates_per 5

  scope :orderByName, -> (page,field){
    includes(:admin).all
    .order(field).page(page)
  }
  
end
