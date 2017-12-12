defmodule Wanikani.LevelProgressionTest do
  use ExUnit.Case

  defmodule MockApi do
    def request(_params, _paths) do
      {:ok,
       %{"data" => [%{"data" => %{"abandoned_at" => nil, "completed_at" => nil,
              "created_at" => "2017-09-27T18:43:02.255061Z", "level" => 37,
              "passed_at" => "2017-10-20T14:00:40.809854Z",
              "started_at" => "2017-09-25T11:22:41.032002Z",
              "unlocked_at" => "2017-09-25T11:09:21.012676Z"},
            "data_updated_at" => "2017-10-24T18:17:41.923042Z", "id" => 269,
            "object" => "level_progression",
            "url" => "https://www.wanikani.com/api/v2/level_progressions/269"},
          %{"data" => %{"abandoned_at" => nil, "completed_at" => nil,
              "created_at" => "2017-10-20T14:00:40.913807Z", "level" => 38,
              "passed_at" => "2017-11-27T08:01:41.333983Z",
              "started_at" => "2017-10-20T14:31:43.297935Z",
              "unlocked_at" => "2017-10-20T14:00:40.902627Z"},
            "data_updated_at" => "2017-11-27T08:01:41.349057Z", "id" => 187593,
            "object" => "level_progression",
            "url" => "https://www.wanikani.com/api/v2/level_progressions/187593"},
          %{"data" => %{"abandoned_at" => nil, "completed_at" => nil,
              "created_at" => "2017-11-27T08:01:41.425807Z", "level" => 39,
              "passed_at" => nil, "started_at" => "2017-11-28T08:03:45.496956Z",
              "unlocked_at" => "2017-11-27T08:01:41.418132Z"},
            "data_updated_at" => "2017-11-28T08:03:45.510192Z", "id" => 210100,
            "object" => "level_progression",
            "url" => "https://www.wanikani.com/api/v2/level_progressions/210100"}],
         "data_updated_at" => "2017-11-28T08:03:45.510192Z", "object" => "collection",
         "pages" => %{"next_url" => nil, "per_page" => 1000, "previous_url" => nil},
         "total_count" => 3,
         "url" => "https://www.wanikani.com/api/v2/level_progressions"}}
    end

    def request(_path) do
      {:ok,
       %{"data" => %{"abandoned_at" => nil, "completed_at" => nil,
           "created_at" => "2017-10-20T14:00:40.913807Z", "level" => 38,
           "passed_at" => "2017-11-27T08:01:41.333983Z",
           "started_at" => "2017-10-20T14:31:43.297935Z",
           "unlocked_at" => "2017-10-20T14:00:40.902627Z"},
         "data_updated_at" => "2017-11-27T08:01:41.349057Z", "id" => 187593,
         "object" => "level_progression",
         "url" => "https://www.wanikani.com/api/v2/level_progressions/187593"}}
    end
  end

  test ".list" do
    params = %{}
    {status, body} = Wanikani.LevelProgression.list(params, MockApi)
    assert :ok == status
    assert 3 == Enum.count(body["data"])
  end

  test ".get" do
    {status, body} = Wanikani.LevelProgression.get(187593, MockApi)
    assert :ok == status
    assert "https://www.wanikani.com/api/v2/level_progressions/187593" == body["url"]
  end

end