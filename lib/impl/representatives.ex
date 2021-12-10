defmodule GoogleCivicApi.Impl.Representatives do
  @moduledoc """
  Documentation for `GoogleCivicApi`.
  """
  use HTTPoison.Base

  @google_sys_var "GOOGLE_API_KEY"

  @doc """
  Looks up political geography and representative information for a single address.
  ## Examples

      iex> GoogleCivicApi.Impl.Representatives.byAddress()
      :world

  """
  @expected_fields ~w(
    officials
    error
  )

  def process_request_url(url) do
    ("https://www.googleapis.com/civicinfo/v2/representatives?" <>
       url <> "&key=#{get_google_api_key()}")
    |> IO.inspect()
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
    |> Map.take(@expected_fields)
    |> Enum.map(fn {k, v} -> {String.to_atom(k), v} end)
  end

  defp get_google_api_key() do
    System.get_env(@google_sys_var)
  end
end
