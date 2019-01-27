defmodule GenserverBlockchain do
  use GenServer

  # Client

  def start_link() do
    GenServer.start_link(__MODULE__, Block.genesis())
  end

  def push(pid, block) do
    GenServer.cast(pid, {:push, block})
  end


  # Server

  @impl true
  def init(chain) do
    {:ok, chain}
  end

  @impl true
  def handle_cast({:push, block}, chain) do
    {:noreply, [block | chain]}
  end

end
