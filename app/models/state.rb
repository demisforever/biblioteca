class State < ApplicationRecord
  validates :user_id, :book_id, :borrowed_at, presence: true

  belongs_to :user
  belongs_to :book
end
