class RemoveAdminIdFromClients < ActiveRecord::Migration[7.0]
  def change
    remove_reference :clients, :admin, index: true, foreign_key: true
  end
end
