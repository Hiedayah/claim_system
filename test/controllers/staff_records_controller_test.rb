require 'test_helper'

class StaffRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_records_index_url
    assert_response :success
  end

end
