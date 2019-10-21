defmodule Hello.AccountsTest do
  use Hello.DataCase

  alias Hello.Accounts

  describe "account_users" do
    alias Hello.Accounts.AccountUser

    @valid_attrs %{email: "some email", name: "some name", password: "some password"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password"}
    @invalid_attrs %{email: nil, name: nil, password: nil}

    def account_user_fixture(attrs \\ %{}) do
      {:ok, account_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_account_user()

      account_user
    end

    test "list_account_users/0 returns all account_users" do
      account_user = account_user_fixture()
      assert Accounts.list_account_users() == [account_user]
    end

    test "get_account_user!/1 returns the account_user with given id" do
      account_user = account_user_fixture()
      assert Accounts.get_account_user!(account_user.id) == account_user
    end

    test "create_account_user/1 with valid data creates a account_user" do
      assert {:ok, %AccountUser{} = account_user} = Accounts.create_account_user(@valid_attrs)
      assert account_user.email == "some email"
      assert account_user.name == "some name"
      assert account_user.password == "some password"
    end

    test "create_account_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account_user(@invalid_attrs)
    end

    test "update_account_user/2 with valid data updates the account_user" do
      account_user = account_user_fixture()
      assert {:ok, %AccountUser{} = account_user} = Accounts.update_account_user(account_user, @update_attrs)
      assert account_user.email == "some updated email"
      assert account_user.name == "some updated name"
      assert account_user.password == "some updated password"
    end

    test "update_account_user/2 with invalid data returns error changeset" do
      account_user = account_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account_user(account_user, @invalid_attrs)
      assert account_user == Accounts.get_account_user!(account_user.id)
    end

    test "delete_account_user/1 deletes the account_user" do
      account_user = account_user_fixture()
      assert {:ok, %AccountUser{}} = Accounts.delete_account_user(account_user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account_user!(account_user.id) end
    end

    test "change_account_user/1 returns a account_user changeset" do
      account_user = account_user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account_user(account_user)
    end
  end
end
