require 'test_helper'

class StatusEtudiantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get status_etudiants_index_url
    assert_response :success
  end

end
