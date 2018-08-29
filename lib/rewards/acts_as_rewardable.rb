module Rewards
  module ActsAsRewardable
    extend ActiveSupport::Concern

    included do
      def set_current_reward
        return if current_reward.present?
        rewards.create
      end

      def teammates
        User.excluding(self)
      end
    end

    module ClassMethods
      def acts_as_rewardable
        has_many :rewards, class_name: 'Rewards::Reward'
        has_many :pieces, class_name: 'Rewards::Piece'

        has_one :current_reward, -> { order('created_at DESC') }, class_name: 'Rewards::Reward'

        after_create :set_current_reward

        scope :excluding, -> (user) { where.not(id: user.id) }
      end
    end
  end
end
