class LocationSerializer < ActiveModel::Serializer
  attributes :id, :street_address, :city_state_zip, :phone, :primary_contact, :status
end
