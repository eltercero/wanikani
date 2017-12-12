defmodule Wanikani.Summary do
  @moduledoc """
  Module for the requests about Summary endpoint
  """

  @doc """
  Get the summary information.

  ```
   Wanikani.Summary.get
  ```
  """
  def get(client \\ Wanikani.Api) do
    client.request("summary")
  end

end