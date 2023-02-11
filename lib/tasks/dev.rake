require 'faker'

namespace :dev do
  desc "Setup the database"
  task setup: :environment do
    show_spinner("Cleaning database") {%x(rails db:drop:_unsafe)}
    show_spinner("Creating database") {%x(rails db:create)}
    show_spinner("Migrating database") {%x(rails db:migrate)}
    show_spinner("Generating the default admin") {%x(rails dev:default_admin)}
    show_spinner("Generating clients", "| All fine!") {%x(rails dev:generate_clients)}
  end

  desc "Generates the default admin."
  task default_admin: :environment do
    Admin.create!(email: "admin@admin.com", password:"123456", password_confirmation:"123456")
  end

  desc "Generates client example list"
  task generate_clients: :environment do
    40.times do |i| 
      Client.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_address,
      zip_code: Faker::Address.zip_code,
      telephone: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email(name: :first_name)
    )    
    end
  end

  def show_spinner (msg_start, msg_end = "| Done!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

  

end
