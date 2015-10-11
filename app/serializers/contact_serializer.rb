class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :company, :twitter
end
