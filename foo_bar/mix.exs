defmodule FooBar.MixProject do
  use Mix.Project

  def project do
    [
      app: :foo_bar,
      version: "5.2.3",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases(),
      config_path: "config/config.exs"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {FooBar, []},
      extra_applications: [:logger]
    ]
  end

  defp releases do
    [
      foo_bar: [
        include_executables_for: [:unix],
        applications: [
          runtime_tools: :permanent,
          telemetry: :permanent
        ],
        include_erts: false,
        path: "rel/foo_bar"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.14.0"},
      {:plug_cowboy, "~> 2.5"}
    ]
  end
end
