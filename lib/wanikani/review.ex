defmodule Wanikani.Review do
  @moduledoc """
  Module for the requests to the Reviews endpoint
  """

  @doc """
  Get a list of reviews.

  Accepted params:
  * ids Integers  Return results tied to ids
  * subject_ids Integers  Return result tied to subject_ids
  * updated_after ISO8601 timestamp in the past Return results which have been updated after the timestamp

  ```
    Wanikani.Review.list()
  ```
  """
  def list(params \\ %{}, client \\ Wanikani.Api) do
    client.request("reviews", params)
  end

  @doc """
  Get a single review study material.

  ```
    Wanikani.Review.get(592160)
  ```
  """
  def get(subject_id, client \\ Wanikani.Api) do
    client.request("reviews/#{subject_id}")
  end

end