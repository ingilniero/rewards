require 'test_helper'

module Rewards
  class PieceTest < ActiveSupport::TestCase
    def test_set_identifier
      reward = rewards_rewards(:haro_current)
      piece = Piece.new(reward: reward)
      piece.set_identifier

      assert_equal 'fourth_quarter', piece.identifier
    end

    def test_next_identifier
      piece = Piece.new
      assert_equal 'first_quarter', piece.next_piece

      piece = rewards_pieces(:haro_first)
      assert_equal 'fourth_quarter', piece.next_piece
    end

    def test_complete_reward
      reward = rewards_rewards(:haro_current)
      piece = Piece.new(reward: reward, identifier: Piece.identifiers['fourth_quarter'])
      piece.complete_reward
      assert reward.complete?
    end
  end
end
