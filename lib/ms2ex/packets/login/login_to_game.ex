defmodule Ms2ex.Packets.LoginToGame do
  import Ms2ex.Packets.PacketWriter

  @config Application.get_env(:ms2ex, Ms2ex)
  @world @config[:world]
  @modes %{success: 0x0}

  def login(auth_data) do
    channel = List.first(@world[:channels])

    __MODULE__
    |> build()
    |> put_byte(@modes.success)
    |> put_ip_address(channel.host)
    |> put_short(channel.port)
    |> put_int(auth_data.token_a)
    |> put_int(auth_data.token_b)
    |> put_int(62_000_000)
  end
end
