defmodule Wanikani.User do
  @moduledoc """
  Module for the requests about User endpoint
  """

  @doc """
  Get the user information.

  ```
   Wanikani.User.get
  ```
  """
  def get(client \\ Wanikani.Api) do
    client.request("user")
  end

end