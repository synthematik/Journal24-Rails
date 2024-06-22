require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "User shouldn't have name" do
    user = User.new(id: 1, email: "sasha@koshka.ru")
    assert_not user.save, "User shouldn't have name"
  end

  test "User shouldn't have the email" do
    user = User.new(name: "Sasha")
    assert_not user.save, "User shouldn't have the email"
  end

  test "user should be valid" do
    user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "user should not be valid without an email" do
    user = User.new(password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "user should not be valid with invalid email format" do
    user = User.new(email: "invalid_email", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "user should not be valid without a password" do
    user = User.new(email: "test@example.com")
    assert_not user.valid?
  end

  test "user should not be valid with a short password" do
    user = User.new(email: "test@example.com", password: "short", password_confirmation: "short")
    assert_not user.valid?
  end

end
