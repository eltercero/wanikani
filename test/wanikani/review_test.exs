defmodule Wanikani.ReviewTest do
  use ExUnit.Case

  defmodule MockApi do
    def request(_params, _paths) do
      {:ok,
       %{"data" => [%{"data" => %{"assignment_id" => 69754227,
              "created_at" => "2017-08-04T14:50:17.685177Z",
              "incorrect_meaning_answers" => 0, "incorrect_reading_answers" => 0,
              "starting_srs_stage" => 8, "starting_srs_stage_name" => "Enlightened",
              "subject_id" => 4596},
            "data_updated_at" => "2017-08-04T14:50:17.685177Z", "id" => 4863,
            "object" => "review",
            "url" => "https://www.wanikani.com/api/v2/reviews/4863"},
          %{"data" => %{"assignment_id" => 68183930,
              "created_at" => "2017-08-04T14:51:15.081341Z",
              "incorrect_meaning_answers" => 0, "incorrect_reading_answers" => 0,
              "starting_srs_stage" => 8, "starting_srs_stage_name" => "Enlightened",
              "subject_id" => 4419},
            "data_updated_at" => "2017-08-04T14:51:15.081341Z", "id" => 5297,
            "object" => "review",
            "url" => "https://www.wanikani.com/api/v2/reviews/5297"},
          %{"data" => %{"assignment_id" => 67801207,
              "created_at" => "2017-08-04T14:51:59.780192Z",
              "incorrect_meaning_answers" => 1, "incorrect_reading_answers" => 0,
              "starting_srs_stage" => 8, "starting_srs_stage_name" => "Enlightened",
              "subject_id" => 4263},
            "data_updated_at" => "2017-08-04T14:51:59.780192Z", "id" => 5693,
            "object" => "review",
            "url" => "https://www.wanikani.com/api/v2/reviews/5693"}]}}
    end

    def request(_path) do
      {:ok,
       %{"data" => %{"assignment_id" => 68183930,
           "created_at" => "2017-08-04T14:51:15.081341Z",
           "incorrect_meaning_answers" => 0, "incorrect_reading_answers" => 0,
           "starting_srs_stage" => 8, "starting_srs_stage_name" => "Enlightened",
           "subject_id" => 4419}, "data_updated_at" => "2017-08-04T14:51:15.081341Z",
         "id" => 5297, "object" => "review",
         "url" => "https://www.wanikani.com/api/v2/reviews/5297"}}
    end
  end

  test ".list" do
    params = %{}
    {status, body} = Wanikani.Review.list(params, MockApi)
    assert :ok == status
    assert 3 == Enum.count(body["data"])
  end

  test ".get" do
    {status, body} = Wanikani.Review.get(5297, MockApi)
    assert :ok == status
    assert "https://www.wanikani.com/api/v2/reviews/5297" == body["url"]
  end

end