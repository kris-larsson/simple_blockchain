defmodule Block do

  @enforce_keys [:data, :hash, :prev_hash, :timestamp]

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
      hash: "GENESIS",
      prev_hash: "GENESIS",
      timestamp: NaiveDateTime.utc_now()
    }
  end

end
