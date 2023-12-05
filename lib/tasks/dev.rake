namespace :dev do
  desc "Setup the development environment"
  task setup: :environment do
    reset_database
    create_kinds_data
    create_contacts_data
    create_phones_data
    create_address_data
  end

  def reset_database
    puts 'Reseting Database...'
    %x(rails db:drop db:create db:migrate)
    puts 'Database Reset...'
  end

  def create_contacts_data
    puts 'Inserting Contacts Data...'
    100.times do |i|
      Contact.create!(
        contact_name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 35.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts 'Contacts Data Inserted!'
  end

  def create_kinds_data
    puts 'Inserting Kinds Data...'
    kinds_of_contact = %w(Friend Bussiness Acquaintance College Family)
    kinds_of_contact.each do |kind_of_contact|
      Kind.create!(description: kind_of_contact)
    end
    puts 'Kinds Data Inserted!'
  end

  def create_phones_data
    puts 'Inserting Phones Data...'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone,
                              contact: contact)
        contact.phones << phone
        contact.save!
      end
    end
    puts 'Phones Data Inserted!'
  end

  def create_address_data
    puts 'Inserting Addresses Data...'
    Contact.all.each do |contact|
      address = Address.create!(street: Faker::Address.street_address,
                                city: Faker::Address.city,
                                contact: contact)
    end
    puts 'Addresses Data Inserted!'
  end

end
