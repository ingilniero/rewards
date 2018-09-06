module Rewards
  class Piece < ApplicationRecord
    belongs_to :reward
    belongs_to :bestowment
    has_many :reward_pieces, through: :reward, source: :pieces

    enum identifier: %i[first_quarter
                        second_quarter
                        third_quarter
                        fourth_quarter]

    before_save :set_identifier

    after_create :complete_reward

    def set_identifier
      self.identifier = next_piece
    end

    def next_piece
      Piece.identifiers.key(reward_pieces.size)
    end

    def complete_reward
      reward.complete! if fourth_quarter?
    end
  end
end
