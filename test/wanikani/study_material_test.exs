defmodule Wanikani.StudyMaterialTest do
  use ExUnit.Case

  defmodule MockApi do
    def request(_params, _paths) do
      {:ok,
       %{"data" => [%{"data" => %{"created_at" => "2017-05-05T16:09:01.792417Z",
              "meaning_note" => nil, "meaning_synonyms" => ["strange"],
              "reading_note" => nil, "subject_id" => 326,
              "subject_type" => "radical"},
            "data_updated_at" => "2017-05-05T20:21:51.719985Z", "id" => 4573,
            "object" => "study_material",
            "url" => "https://www.wanikani.com/api/v2/study_materials/4573"},
          %{"data" => %{"created_at" => "2016-03-06T08:45:57.648369Z",
              "meaning_note" => "No f way that is  hand", "meaning_synonyms" => [],
              "reading_note" => nil, "subject_id" => 41, "subject_type" => "radical"},
            "data_updated_at" => "2017-05-15T07:56:48.138353Z", "id" => 382083,
            "object" => "study_material",
            "url" => "https://www.wanikani.com/api/v2/study_materials/382083"},
          %{"data" => %{"created_at" => "2016-12-16T18:04:43.871681Z",
              "meaning_note" => nil, "meaning_synonyms" => ["zancos"],
              "reading_note" => nil, "subject_id" => 277,
              "subject_type" => "radical"},
            "data_updated_at" => "2017-05-17T13:46:19.686848Z", "id" => 592160,
            "object" => "study_material",
            "url" => "https://www.wanikani.com/api/v2/study_materials/592160"},
          %{"data" => %{"created_at" => "2017-09-25T11:25:33.654614Z",
              "meaning_note" => nil, "meaning_synonyms" => ["pincho", "brocheta"],
              "reading_note" => nil, "subject_id" => 365,
              "subject_type" => "radical"},
            "data_updated_at" => "2017-09-25T11:25:36.510157Z", "id" => 1955956,
            "object" => "study_material",
            "url" => "https://www.wanikani.com/api/v2/study_materials/1955956"}],
         "data_updated_at" => "2017-09-25T11:25:36.510157Z", "object" => "collection",
         "pages" => %{"next_url" => nil, "per_page" => 1000, "previous_url" => nil},
         "total_count" => 4,
         "url" => "https://www.wanikani.com/api/v2/study_materials?subject_type=radical"}}
    end

    def request(_path) do
      {:ok,
       %{"data" => %{"created_at" => "2016-12-16T18:04:43.871681Z",
           "meaning_note" => nil, "meaning_synonyms" => ["zancos"],
           "reading_note" => nil, "subject_id" => 277, "subject_type" => "radical"},
         "data_updated_at" => "2017-05-17T13:46:19.686848Z", "id" => 592160,
         "object" => "study_material",
         "url" => "https://www.wanikani.com/api/v2/study_materials/592160"}}
    end
  end

  test ".list" do
    params = %{type: "radical", levels: "1,2"}
    {status, body} = Wanikani.StudyMaterial.list(params, MockApi)
    assert :ok == status
    assert 4 == Enum.count(body["data"])
  end

  test ".get" do
    {status, body} = Wanikani.StudyMaterial.get(493, MockApi)
    assert :ok == status
    assert "https://www.wanikani.com/api/v2/study_materials/592160" == body["url"]
  end

end