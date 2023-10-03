class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'


  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
  validate :sender_and_receiver_not_equal

  private

  def sender_and_receiver_not_equal
    errors.add(:base, "Sender and receiver must be different users") if sender_id == receiver_id
  end
end
