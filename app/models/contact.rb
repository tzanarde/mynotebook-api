class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def first_name
    self.contact_name.split(' ').first
  end

  def kind_description
    self.kind.description
  end

  def as_json(options={})
    super(methods: [:first_name, :kind_description],
          include: { kind: { only: :description },
                     phones: { only: :number },
                     address: { only: [:street, :city] } })
  end
end
