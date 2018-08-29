require 'test_helper'

module Rewards
  class RewardTest < ActiveSupport::TestCase
    def test_default_state
      reward = Reward.new
      assert_equal Reward.states["incomplete"], Reward.states[reward.state]
    end
  end
end
