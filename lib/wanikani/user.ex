defmodule Wanikani.User do
  @moduledoc """
  Module for the requests to the User endpoint
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