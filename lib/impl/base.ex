defmodule GoogleCivicApi.Impl.Base do
  @moduledoc """
  Documentation for `GoogleCivicApi`.
  """
  use HTTPoison.Base


  def process_request_url(url) do
    "https://www.googleapis.com/civicinfo/v2/" <> url <> "&key=#{get_google_api_key()}"
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end

  defp get_google_api_key() do
    System.get_env(get_google_sys_var())
  end

  defp get_google_sys_var() do
    Application.fetch_env!(:google_civic_api, :api_sys_var)
  end
end
