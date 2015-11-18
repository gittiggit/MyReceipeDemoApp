require 'test_helper'

class ReceipeTest < ActiveSupport::TestCase
  def setup
    @receipe = Receipe.new(name: "chicken parm" , summary: "This is the best recipe I ever tested", 
      description: "This is the best recipe I ever teste This is the best recipe I ever teste ")
  end
  
  test "receipe should be valid" do
    assert @receipe.valid?
  end
  test "name should be present" do
     @receipe.name = " "
     assert_not @receipe.valid?
  end
  
end
