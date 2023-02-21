defmodule FooBar do
  use Application

  def start(_type, _args) do

    {:ok, hostname} = :inet.gethostname()
    Application.put_env(:foo_bar, :hostname, "#{hostname}")

    FooBar.ShutdownHandler.swap_handler()

    FooBar.Supervisor.start_link()
  end

  def hostname() do
    Application.get_env(:foo_bar, :hostname, "localhost")
  end

end

defmodule FooBar.ShutdownHandler do
  @behaviour :gen_event

  def swap_handler() do
    :gen_event.swap_sup_handler(:erl_signal_server, {:erl_signal_handler, []}, {__MODULE__, []})
  end

  def init(_), do: {:ok, nil}

  def handle_event(:sigterm, _state) do

    :erlang.halt()
  end

  def handle_call(_, state), do: {:ok, :ok, state}
end
