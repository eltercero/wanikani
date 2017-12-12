defmodule Wanikani.StudyMaterial do
  @moduledoc """
  Module for the requests to the StudyMaterials endpoint
  """

  @doc """
  Get a list of study materials.

  Accepted params:
  * ids Integers  Return results tied to ids
  * subject_ids Integers  Return result tied to subject_ids
  * subject_type  radical, kanji, vocabulary  Return results of specified subject_type
  * updated_after ISO8601 timestamp in the past Return results which have been updated after the timestamp

  ```
    Wanikani.StudyMaterial.list(%{subject_type: "radical"})
  ```
  """
  def list(params \\ %{}, client \\ Wanikani.Api) do
    client.request("study_materials", params)
  end

  @doc """
  Get a single review.

  ```
    Wanikani.StudyMaterial.get(592160)
  ```
  """
  def get(subject_id, client \\ Wanikani.Api) do
    client.request("study_materials/#{subject_id}")
  end

end