require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "Comment can't be without body" do
    com = Comment.new(commenter: "Sasha")
    assert_not com.save, "Comment can't be empty"
  end
end
