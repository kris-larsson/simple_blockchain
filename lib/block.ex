defmodule Block do

  @enforce_keys [:data, :prev_hash, :timestamp]

  defstruct [:data, :hash, :prev_hash, :timestamp]

  @type t :: %__MODULE__{
    data: String.t(),
    hash: String.t(),
    prev_hash: String.t(),
    timestamp: NaiveDateTime
  }

  def genesis do
    %Block{
      data: "GENESIS",
      prev_hash: "ZERO_BLOCK",
      timestamp: NaiveDateTime.utc_now()
    }
  end

  def new(data, prev_hash) do
    %Block{
      data: data,
      prev_hash: prev_hash,
      timestamp: NaiveDateTime.utc_now()
    }
  end

  def valid?(%Block{} = block), do: Crypto.hash(block) == block.hash
  def valid?(_), do: false

  def valid?(%Block{} = block, %Block{} = prev_block) do
    block.prev_hash == prev_block.hash and valid?(block)
  end

  def valid?(_, _), do: false

end
