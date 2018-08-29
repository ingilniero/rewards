require 'test_helper'

module Rewards
  class HomeControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'GET index' do
      sign_in users(:aranza)
      get root_path
      assert_response :success
    end
  end
end
