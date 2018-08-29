module Rewards
  class Bestowment < ApplicationRecord
    has_one :piece

    belongs_to :bestower, class_name: 'User', foreign_key: :bestower_id
    belongs_to :bestowed, class_name: 'User', foreign_key: :bestowed_id

    after_create :bestow_piece

    def bestow_piece
      create_piece(reward: bestowed.current_reward)
    end
  end
end
