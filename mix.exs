defmodule Wanikani.Mixfile do
  use Mix.Project

  def project do
    [
      app: :wanikani,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      { :poison, "~> 3.1" },
      { :httpoison, "~> 0.13.0"}
    ]
  end

  defp description do
    """
    Elixir wrapper for Wanikani API V2 (http://www.wanikani.com/)
    """
  end

  defp package do
    [
     files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Víctor Martín"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/eltercero/wanikani"}
    ]
  end
end
