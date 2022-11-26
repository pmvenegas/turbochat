class Message < ApplicationRecord
  validates :body, presence: true

  # TODO: implement channels
  broadcasts_to ->(message) { "messages" }
end
