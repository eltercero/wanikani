defmodule Wanikani.AssignmentTest do
  use ExUnit.Case

  defmodule MockApi do
    def request(_params, _paths) do
      {:ok,
       %{"data" => [%{"data" => %{"available_at" => nil,
              "burned_at" => "2017-11-15T12:09:44.973240Z", "level" => 30,
              "passed" => true, "passed_at" => "2017-05-26T08:30:14.508631Z",
              "resurrected" => false, "srs_stage" => 9, "srs_stage_name" => "Burned",
              "started_at" => nil, "subject_id" => 5401,
              "subject_type" => "vocabulary",
              "unlocked_at" => "2017-05-19T21:17:56.585928Z"},
            "data_updated_at" => "2017-12-11T18:03:14.000000Z", "id" => 29255022,
            "object" => "assignment",
            "url" => "https://www.wanikani.com/api/v2/assignments/29255022"},
          %{"data" => %{"available_at" => nil,
              "burned_at" => "2017-11-27T09:10:07.609423Z", "level" => 30,
              "passed" => true, "passed_at" => "2017-05-28T08:22:34.066419Z",
              "resurrected" => false, "srs_stage" => 9, "srs_stage_name" => "Burned",
              "started_at" => nil, "subject_id" => 5349,
              "subject_type" => "vocabulary",
              "unlocked_at" => "2017-05-19T21:17:56.585928Z"},
            "data_updated_at" => "2017-12-11T18:03:14.000000Z", "id" => 35032517,
            "object" => "assignment",
            "url" => "https://www.wanikani.com/api/v2/assignments/35032517"}]}}
    end

    def request(_path) do
      {:ok,
       %{"data" => %{"available_at" => nil,
           "burned_at" => "2017-11-26T17:36:53.905971Z", "level" => 30,
           "passed" => true, "passed_at" => "2017-06-08T07:48:58.829587Z",
           "resurrected" => false, "srs_stage" => 9, "srs_stage_name" => "Burned",
           "started_at" => nil, "subject_id" => 5323, "subject_type" => "vocabulary",
           "unlocked_at" => "2017-05-30T20:18:41.046611Z"},
         "data_updated_at" => "2017-12-11T18:03:14.000000Z", "id" => 64591295,
         "object" => "assignment",
         "url" => "https://www.wanikani.com/api/v2/assignments/64591295"}}
    end
  end

  test ".list" do
    params = %{type: "radical", levels: "1,2"}
    {status, body} = Wanikani.Assignment.list(params, MockApi)
    assert :ok == status
    assert 2 == Enum.count(body["data"])
  end

  test ".get" do
    {status, body} = Wanikani.Assignment.get(493, MockApi)
    assert :ok == status
    assert "https://www.wanikani.com/api/v2/assignments/64591295" == body["url"]
  end

end