require_relative 'spec_helper'

require 'mocha'
require 'mocha/integration/mini_test'

class TestStatus < MiniTest::Unit::TestCase

  def setup
    @session = create_session
    #savon.stubs(:mc_enum_status).with(
      #:username => "admin",
      #:password => "DPCJPqaDTEzB1zhx").returns(:statuses)
  end

  def test_status_can_be_found
    skip
    savon.expects(:mc_enum_status).returns(:statuses)
    @session.config.statuses
  end
end
