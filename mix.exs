defmodule RedditWrapper.MixProject do
  use Mix.Project

  def project do
    [
      app: :reddit_wrapper,
      version: "0.1.0",
      elixir: "~> 1.7",
      description: description(),
      package: package(),
      name: "reddit_wrapper",
      source_url: "https://github.com/nkyian/reddit_wrapper",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp description() do
    "Reddit API Wrapper"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "reddit_wrapper",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nkyian/reddit_wrapper"}
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
      {:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
