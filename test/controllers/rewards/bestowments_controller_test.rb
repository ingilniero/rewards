require 'test_helper'

module Rewards
  class BestowmentsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'GET new' do
      sign_in users(:aranza)

      get new_bestowment_path
      assert_response :success
    end

    test 'POST create' do
      aranza = users(:aranza)
      angel = users(:angel)

      sign_in aranza

      assert_changes('Piece.count') do
        post bestowments_path, params: {
          bestowment: { bestowed_id: angel.id }
        }
      end

      assert_redirected_to root_url
    end
  end
end

