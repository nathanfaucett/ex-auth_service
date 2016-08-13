defmodule AuthService.Utils do

  def create_token() do
    :crypto.strong_rand_bytes(64)
      |> Base.url_encode64()
      |> binary_part(0, 64)
  end
end
