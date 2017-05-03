require 'test_helper'

class ScrapertestControllerTest < ActionDispatch::IntegrationTest
  test "should get prompt" do
    get scrapertest_prompt_url
    assert_response :success
  end

end
