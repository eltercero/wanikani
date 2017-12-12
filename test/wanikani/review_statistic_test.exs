defmodule Wanikani.ReviewStatisticTest do
  use ExUnit.Case

  defmodule MockApi do
    def request(_params, _paths) do
      {:ok,
     %{"data" => [%{"data" => %{"created_at" => "2017-04-20T21:31:10.806649Z",
            "meaning_correct" => 11, "meaning_current_streak" => 11,
            "meaning_incorrect" => 1, "meaning_max_streak" => 11,
            "percentage_correct" => 92, "reading_correct" => 11,
            "reading_current_streak" => 3, "reading_incorrect" => 1,
            "reading_max_streak" => 8, "subject_id" => 1377,
            "subject_type" => "kanji"},
          "data_updated_at" => "2017-11-28T07:55:20.016831Z", "id" => 411994,
          "object" => "review_statistic",
          "url" => "https://www.wanikani.com/api/v2/review_statistics/411994"},
        %{"data" => %{"created_at" => "2017-04-07T21:34:57.751344Z",
            "meaning_correct" => 14, "meaning_current_streak" => 1,
            "meaning_incorrect" => 4, "meaning_max_streak" => 6,
            "percentage_correct" => 85, "reading_correct" => 14,
            "reading_current_streak" => 14, "reading_incorrect" => 1,
            "reading_max_streak" => 14, "subject_id" => 1339,
            "subject_type" => "kanji"},
          "data_updated_at" => "2017-11-28T07:53:56.674025Z", "id" => 412199,
          "object" => "review_statistic",
          "url" => "https://www.wanikani.com/api/v2/review_statistics/412199"}]}}
    end

    def request(_path) do
      {:ok,
       %{"data" => %{"created_at" => "2017-04-07T21:34:57.751344Z",
           "meaning_correct" => 14, "meaning_current_streak" => 1,
           "meaning_incorrect" => 4, "meaning_max_streak" => 6,
           "percentage_correct" => 85, "reading_correct" => 14,
           "reading_current_streak" => 14, "reading_incorrect" => 1,
           "reading_max_streak" => 14, "subject_id" => 1339,
           "subject_type" => "kanji"},
         "data_updated_at" => "2017-11-28T07:53:56.674025Z", "id" => 412199,
         "object" => "review_statistic",
         "url" => "https://www.wanikani.com/api/v2/review_statistics/412199"}}
    end
  end

  test ".list" do
    params = %{subject_type: "kanji"}
    {status, body} = Wanikani.ReviewStatistic.list(params, MockApi)
    assert :ok == status
    assert 2 == Enum.count(body["data"])
  end

  test ".get" do
    {status, body} = Wanikani.ReviewStatistic.get(412199, MockApi)
    assert :ok == status
    assert "https://www.wanikani.com/api/v2/review_statistics/412199" == body["url"]
  end

end