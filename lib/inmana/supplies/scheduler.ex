defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExprationNotification

  @frequency :timer.minutes(1)

  # CLIENT

  def start_link(_state) do
    IO.puts("Starting Inmana.Supplies.Scheduler")

    GenServer.start_link(__MODULE__, %{})
  end

  def start, do: GenServer.start(__MODULE__, %{})
  def put(pid, key, value), do: GenServer.cast(pid, {:put, key, value})
  def get(pid, key), do: GenServer.call(pid, {:get, key})

  # SERVER

  @impl GenServer
  def init(state \\ %{}) do
    schedule_notification()

    {:ok, state}
  end

  @impl GenServer
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  @impl GenServer
  def handle_call({:get, key}, _caller, state) do
    {:reply, Map.get(state, key), state}
  end

  @impl GenServer
  def handle_info(:generate, state) do
    ExprationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    Process.send_after(self(), :generate, @frequency)
  end
end
