FactoryBot.define do
  factory :contact do
    contact_name { 'tiago' }
    email { 'tiago@gmail.com' }
    birthdate { Date.today - 31.years }
    association :kind
  end
end
