require "test_helper"

class ArticleTest < ActiveSupport::TestCase



  test "Can't create articles without title" do
    art = Article.new(id: 123, title: "", body: "123456789 987654321")
    assert_not art.save, "Title can't be blank"
  end

  test "Can't create articles with empty body" do
    art = Article.new(title: "New title")
    assert_not art.save, "Can't create articles with empty body"
  end
end
