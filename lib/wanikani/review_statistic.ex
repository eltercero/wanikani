defmodule Wanikani.ReviewStatistic do
  @moduledoc """
  Module for the requests to the ReviewStatistics endpoint
  """

  @doc """
  Get a list of review statistics.

  Accepted params:
  * ids Integers  Return results tied to ids
  * subject_ids Integers  Return result tied to subject_ids
  * subject_type  radical, kanji, vocabulary  Return results of specified subject_type
  * updated_after ISO8601 timestamp in the past Return results which have been updated after the timestamp

  ```
    Wanikani.ReviewStatistic.list(%{subject_type: "kanji"})
  ```
  """
  def list(params, client \\ Wanikani.Api) do
    client.request("review_statistics", params)
  end

  @doc """
  Get a single review stat.

  ```
    Wanikani.ReviewStatistic.get(64591295)
  ```
  """
  def get(subject_id, client \\ Wanikani.Api) do
    client.request("review_statistics/#{subject_id}")
  end

end