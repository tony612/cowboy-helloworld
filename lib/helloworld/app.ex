defmodule Helloworld.App do
  use Application

  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
      {:_, [
        {:_, Helloworld.Handler, []}
      ]}
    ])
    {:ok, pid} = :cowboy.start_clear(:http, [port: 8080], %{
      env: %{dispatch: dispatch}
    })
    IO.puts("==> App starts at process #{inspect(self())}")
    IO.puts("==> Cowboy starts with process #{inspect(pid)}")
    {:ok, pid}
  end
end
