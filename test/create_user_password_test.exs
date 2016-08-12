defmodule AuthServiceTest.CreateUserPasswordTest do
  use ExUnit.Case
  doctest AuthService


  test "should create user with a password" do
    user = AuthServiceTest.HelpersTest.create_user()
    AuthService.Repo.delete!(user)

    assert Map.get(user, :uuid) == AuthServiceTest.HelpersTest.test_uuid
    assert Map.get(user, :email) == AuthServiceTest.HelpersTest.test_email
  end
end