defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Raphael",
        password: "12345467",
        nickname: "Teste",
        email: "teste@teste.com",
        age: 29
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Raphael", age: 29, id: ^user_id} = user
    end

    test "when there are invalid params, returns an user" do
      params = %{
        name: "Raphael",
        password: "12345467",
        nickname: "Teste",
        email: "teste@teste.com",
        age: 16
      }

      {:error, changeset} = Create.call(params)

      assert "banna" = changeset
    end
  end
end
