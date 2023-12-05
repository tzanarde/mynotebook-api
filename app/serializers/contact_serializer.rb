class ContactSerializer < ActiveModel::Serializer
  attributes :id,
             :contact_name,
             :email,
             :birthdate

  belongs_to :kind # do
    # link(:related) { kind_url(object.kind.id) }
  # end
  has_many :phones
  has_one :address

  # link(:self) { contact_url(object.id) }

  meta do
    { first_name: 'teste' }
  end
end
