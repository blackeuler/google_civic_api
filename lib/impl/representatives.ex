defmodule GoogleCivicApi.Impl.Representatives do
  @moduledoc """
  Documentation for `GoogleCivicApi`.
  """

  @doc """
  Looks up political geography and representative information for a single address.
  ## Examples

      iex> GoogleCivicApi.Impl.Representatives.byAddress()
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

  @type address ::
          {city :: String.t(), line1 :: String.t(), state :: String.t(), zip :: String.t()}
  @type official :: {
          locations :: [address],
          phones :: list(String.t()),
          name :: String.t(),
          party :: String.t()
        }
  @spec by_address(String.t()) :: [official]
  def by_address(address) do
    {:ok, %HTTPoison.Response{body: %{"officials" => officials}}} =
      ("representatives?" <> "address=#{URI.encode(address)}")
      |> GoogleCivicApi.Impl.Base.get()

    Enum.map(officials, fn x -> filter_(x) end)
  end

  defp filter_(%{"address" => a, "party" => party, "name" => n, "phones" => p}) do
    %{
      locations: Enum.map(a, fn x -> filter_address(x) end),
      party: party,
      name: n,
      phones: p
    }
  end

  defp filter_address(%{"city" => c, "line1" => l1, "state" => state, "zip" => _}) do
    %{address: %{city: c, line1: l1, state: state}}
  end
end
