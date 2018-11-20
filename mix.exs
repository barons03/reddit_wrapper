defmodule RedditWrapper.MixProject do
  use Mix.Project

  def project do
    [
      app: :reddit_wrapper,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RedditWrapper.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # HTTP Client
      {:httpoison, "~> 1.4"},
      # JSON Support
      {:jason, "~> 1.1"},
      # Validation support
      {:vex, "~> 0.8.0"},
      {:exconstructor, "~> 1.1.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
