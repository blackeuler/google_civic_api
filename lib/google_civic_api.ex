defmodule GoogleCivicApi do
  @moduledoc """
  Documentation for `GoogleCivicApi`.
  """
  alias GoogleCivicApi.Impl.Representatives

  @doc """
  Hello world.

  ## Examples

      iex> GoogleCivicApi.hello()
      :world

  """
  def representatives_by_address(address) do
    Representatives.by_address(address)
  end
end
