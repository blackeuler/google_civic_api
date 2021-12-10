defmodule GoogleCivicApi.Representatives do
  @moduledoc """
  Documentation for `GoogleCivicApi.Representatives``
  """
  alias GoogleCivicApi.Impl.Representatives



  @doc """
  Returns a list of representative's basic information and contact for a given address
  ## Examples

      iex> GoogleCivicApi.Representatives.byAddress(some_baltimore_addr)
        [ %{
            locations: [
            %{
                address: %{
                city: "Baltimore",
                line1: "111 North Calvert Street",
                state: "MD"
                }
            }
            ],
            name: "Marilyn Bentley",
            party: "Democratic Party",
            phones: ["(410) 333-3733"]
        }]

  """
  defdelegate by_address(address), to: Representatives

end
