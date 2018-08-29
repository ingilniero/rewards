require_dependency "rewards/application_controller"

module Rewards
  class BestowmentsController < ApplicationController
    def new
      @bestowment = Rewards::Bestowment.new
    end

    def create
      @bestowment = Rewards::Bestowment.new(bestowment_params)
      @bestowment.bestower = current_user

      if @bestowment.save
        flash[:notice] = 'Bestowment created successfully!'
        redirect_to root_url
      else
        render :new
      end
    end

    def bestowment_params
      params.require(:bestowment).permit(:bestowed_id)
    end
  end
end
