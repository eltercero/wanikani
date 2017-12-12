defmodule Wanikani.User do

  def get(client \\ Wanikani.Api) do
    client.request("user")
  end

end