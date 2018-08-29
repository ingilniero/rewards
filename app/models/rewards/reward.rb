module Rewards
  class Reward < ApplicationRecord
    belongs_to :user
    has_many :pieces

    enum state: %i[incomplete complete]
  end
end
