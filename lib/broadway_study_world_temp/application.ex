defmodule BroadwayStudyWorldTemp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias WorldTemp.{CityProducer, TempProcessor, TempTracker}

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: BroadwayStudyWorldTemp.Worker.start_link(arg)
      # {BroadwayStudyWorldTemp.Worker, arg}
      TempTracker,
      CityProducer,
      TempProcessor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BroadwayStudyWorldTemp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
