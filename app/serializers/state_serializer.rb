class StateSerializer < ActiveModel::Serializer
  attributes :id, :borrowed_at, :returned_at

  belongs_to :user
  belongs_to :book
end
