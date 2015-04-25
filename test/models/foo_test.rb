require "test_helper"

class FooTest < ActiveSupport::TestCase

  test "foo" do
    fooperty = Fooperty.new
    fooperty.save!
    foonit = Foonit.create(fooperty: fooperty, name: "Europa")
    foonit.save!

    assert_difference('FooOrder.count') do
      foorder = FooOrder.new(foonit: foonit, fooperty: fooperty)
      foorder.save!
    end
  end

end
