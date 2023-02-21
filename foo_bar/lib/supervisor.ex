defmodule FooBar.Supervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_options) do

    children = [
      {Plug.Cowboy, scheme: :http, plug: FooBar.API, options: [ip: {0,0,0,0}, port: 20_000]},
      FooBar.Startup
    ]

    Supervisor.init(children, strategy: :one_for_one, max_restarts: 10)
  end

end
