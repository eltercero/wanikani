defmodule Wanikani.Assignment do
  @moduledoc """
  Module for the requests to the Assignments endpoint
  """

  @doc """
  Get a list of assignments.

  Accepted params:
  * ids String  Integers  Return results tied to ids
  * subject_ids String  Integers  Return result tied to subject_ids
  * subject_type  String  radical, kanji, vocabulary  Return results of specified subject_type
  * levels  String  Integers between 1 and 60 Return results of specified levels
  * available_before  String  ISO8601 timestamp Return assignment reviews available before timestamp
  * available_after String  ISO8601 timestamp Return assignment reviews available after timestamp
  * srs_stages  String  Integers between 0 and 9  Return assignments of specified srs stages. Note, 0 is lessons, 9 is the burned state
  * passed  Boolean true, false Return assignments which have reach Guru (aka srs_stage 5) at some point (true) or which have never been Guru’d (false)
  * burned  Boolean true, false Return assignments which have been burned at some point (true) or never have been burned (false)
  * updated_after String  ISO8601 timestamp in the past Return results which have been updated after the timestamp

  ```
    Wanikani.Assignment.list(%{burned: true, levels: "1,2"})
  ```
  """
  def list(params \\ [], client \\ Wanikani.Api) do
    client.request("assignments", params)
  end

  @doc """
  Get a single assignment.

  ```
    Wanikani.Assignment.get(64591295)
  ```
  """
  def get(subject_id, client \\ Wanikani.Api) do
    client.request("assignments/#{subject_id}")
  end

end