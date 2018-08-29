require_dependency "rewards/application_controller"

module Rewards
  class HomeController < ApplicationController
    def index
      @rewards = current_user.rewards
      @current_reward = current_user.current_reward
    end
  end
end
