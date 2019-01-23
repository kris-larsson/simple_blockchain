defmodule Crypto do
  @hash_fields [:data, :prev_hash, :timestamp]

  defp sha256(binary) do
    :crypto.hash(:sha256, binary)
    |> Base.encode16()
  end

  def hash(%Block{} = block) do
    block
    |> Map.take(@hash_fields)
    |> Poison.encode!()
    |> sha256()
  end

  def add_hash(%Block{} = block) do
    Map.put(block, :hash, hash(block))
  end
end
