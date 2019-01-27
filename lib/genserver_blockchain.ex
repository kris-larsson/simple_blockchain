defmodule GenServerBlockchain do
  use GenServer

  # Client

  def start_link() do
    genesis = SimpleBlockchain.create_genesis_block()
    GenServer.start_link(__MODULE__, genesis, name: __MODULE__)
  end

  def view do
    GenServer.call(__MODULE__, :lookup)
  end

  def push(block) do
    GenServer.cast(__MODULE__, {:push, block})
  end


  # Server

  @impl true
  def init(chain) do
    {:ok, chain}
  end

  @impl true
  def handle_call(:lookup, _from, chain) do
    {:reply, chain, chain}
  end

  @impl true
  def handle_cast({:push, block}, chain) do
    {:noreply, [block | chain]}
  end

end
