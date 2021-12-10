defmodule GoogleCivicApi.Representatives do
  @moduledoc """
  Documentation for `GoogleCivicApi.Representatives``
  """
  alias GoogleCivicApi.Impl.Representatives


  @doc """
  Looks up political geography and representative information for a single address.
  ## Examples

      iex> GoogleCivicApi.Representatives.byAddress()
      :world

  """

  def by_address(address) do
    Representatives.get("address=#{URI.encode(address)}")
  end

end
