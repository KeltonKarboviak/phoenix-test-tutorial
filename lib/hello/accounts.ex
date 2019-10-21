defmodule Hello.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Accounts.AccountUser

  @doc """
  Returns the list of account_users.

  ## Examples

      iex> list_account_users()
      [%AccountUser{}, ...]

  """
  def list_account_users do
    Repo.all(AccountUser)
  end

  @doc """
  Gets a single account_user.

  Raises `Ecto.NoResultsError` if the Account user does not exist.

  ## Examples

      iex> get_account_user!(123)
      %AccountUser{}

      iex> get_account_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account_user!(id), do: Repo.get!(AccountUser, id)

  @doc """
  Creates a account_user.

  ## Examples

      iex> create_account_user(%{field: value})
      {:ok, %AccountUser{}}

      iex> create_account_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account_user(attrs \\ %{}) do
    %AccountUser{}
    |> AccountUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account_user.

  ## Examples

      iex> update_account_user(account_user, %{field: new_value})
      {:ok, %AccountUser{}}

      iex> update_account_user(account_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account_user(%AccountUser{} = account_user, attrs) do
    account_user
    |> AccountUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AccountUser.

  ## Examples

      iex> delete_account_user(account_user)
      {:ok, %AccountUser{}}

      iex> delete_account_user(account_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account_user(%AccountUser{} = account_user) do
    Repo.delete(account_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account_user changes.

  ## Examples

      iex> change_account_user(account_user)
      %Ecto.Changeset{source: %AccountUser{}}

  """
  def change_account_user(%AccountUser{} = account_user) do
    AccountUser.changeset(account_user, %{})
  end
end
