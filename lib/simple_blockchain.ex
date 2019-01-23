defmodule SimpleBlockchain do
  def create_genesis_block do
    [ Crypto.add_hash(Block.genesis()) ]
  end
end
