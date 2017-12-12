defmodule Wanikani.Subject do
  @moduledoc """
  Module for the requests to the Subjects endpoint
  """

  @doc """
  Get a list of subjects (radicals, kanji, vocabulary).

  Accepted params:
  * ids String  Integers  Return results tied to ids
  * type  String  radical, kanji, vocabulary  Return subjects of the specified type
  * slugs String  String  Return subjects of the specified slug
  * levels  String  Integers between 1 and 60 Return subjects at the specified levels
  * updated_after String  ISO8601 timestamp in the past Return results which have been updated after the timestamp

  ```
    Wanikani.Subject.list(%{type: "radical", levels: "1,2"})
    Wanikani.Subject.list(%{type: "kanji", slug: "月"})
  ```
  """
  def list(params \\ %{}, client \\ Wanikani.Api) do
    client.request("subjects", params)
  end

  @doc """
  Get a single subject.

  ```
    Wanikani.Subject.get(2)
  ```
  """
  def get(subject_id, client \\ Wanikani.Api) do
    client.request("subjects/#{subject_id}")
  end

end