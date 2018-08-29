module Rewards
  class Piece < ApplicationRecord
    belongs_to :reward
    belongs_to :bestowment

    enum identifier: %i[first_quarter
                        second_quarter
                        third_quarter
                        foruth_quarter]
  end
end
