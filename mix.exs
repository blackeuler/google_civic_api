defmodule GoogleCivicApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :google_civic_api,
      name: "GoogleCivicApi",
      version: "0.1.1",
      elixir: "~> 1.13",
      description: description(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      source_url: "https://github.com/blackeuler/google_civic_api"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      env: [api_sys_var: "GOOGLE_API_KEY"],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"},
    {:ex_doc, ">= 0.0.0", only: :dev, runtime: false} ]
  end

  defp description() do
    "Yet another wrapper around the GoogleCivivApi. Nothing to see here."
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/blackeuler/google_civic_api"}
    ]
  end
end
