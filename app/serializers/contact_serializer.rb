class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :twitter, :phone, :birthday, :relationship
end
