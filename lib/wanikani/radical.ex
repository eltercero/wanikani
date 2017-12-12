defmodule Wanikani.Radical do
  @moduledoc """
  Module for the requests about Radicals endpoint with Radical type added.
  """

  @doc """
  Get a list of kanjis.

  Accepted params:
  * ids String  Integers  Return results tied to ids
  * slugs String  String  Return subjects of the specified slug
  * levels  String  Integers between 1 and 60 Return subjects at the specified levels
  * updated_after String  ISO8601 timestamp in the past Return results which have been updated after the timestamp

  ```
    Wanikani.Radical.list(%{levels: "1,2"})
    Wanikani.Radical.list(%{slug: "月"})
  ```
  """
  def list(params, client \\ Wanikani.Api) do
    new_params = Map.merge(params, %{type: "radical"})
    Wanikani.Subject.list(new_params, client)
  end

  @doc """
  Get a single subject.

  ```
    Wanikani.Radical.get(2)
  ```
  """
  def get(subject_id, client \\ Wanikani.Api) do
    Wanikani.Subject.get(subject_id, client)
  end

end