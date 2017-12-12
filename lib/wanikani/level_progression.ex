defmodule Wanikani.LevelProgression do
  @moduledoc """
  Module for the requests to the LevelProgressions endpoint
  """

  @doc """
  Get a list of review statistics.

  Accepted params:
  * ids Integers  Return results tied to ids
  * updated_after ISO8601 timestamp in the past Return results which have been updated after the timestamp

  ```
    Wanikani.LevelProgression.list()
  ```
  """
  def list(params\\[], client \\ Wanikani.Api) do
    client.request("level_progressions", params)
  end

  @doc """
  Get a single level progression.

  ```
    Wanikani.LevelProgression.get(64591295)
  ```
  """
  def get(subject_id, client \\ Wanikani.Api) do
    client.request("level_progressions/#{subject_id}")
  end

end