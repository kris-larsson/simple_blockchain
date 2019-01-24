defmodule SimpleBlockchain do

  def create_genesis_block do
    [ Crypto.add_hash(Block.genesis()) ]
  end

  def create_new_block(blockchain, data) do
    %Block{hash: prev_hash} = hd(blockchain)

    block =
      data
      |> Block.new(prev_hash)
      |> Crypto.add_hash()

    [ block | blockchain ]
  end

  def valid?([head | tail]) do
    genesis = Enum.reduce_while(tail, head, fn(prev, current) ->
      cond do
         Block.valid?(current, prev) -> {:cont, prev}
         true -> {:halt, false}
      end
    end)

    Block.valid?(genesis)
  end

end
