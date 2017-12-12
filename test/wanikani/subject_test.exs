defmodule Wanikani.SubjectTest do
  use ExUnit.Case

  defmodule MockApi do
    def request(_params, _paths) do
      {:ok,
       %{"data" => [%{"data" => %{"character" => "一", "character_images" => [],
              "created_at" => "2012-02-27T18:08:16.000000Z",
              "document_url" => "https://www.wanikani.com/radicals/ground",
              "level" => 1,
              "meanings" => [%{"meaning" => "Ground", "primary" => true}],
              "slug" => "ground"}, "data_updated_at" => "2017-06-12T23:21:17.248393Z",
            "id" => 1, "object" => "radical",
            "url" => "https://www.wanikani.com/api/v2/subjects/1"},
          %{"data" => %{"character" => "ハ", "character_images" => [],
              "created_at" => "2012-02-27T18:11:07.000000Z",
              "document_url" => "https://www.wanikani.com/radicals/fins",
              "level" => 1, "meanings" => [%{"meaning" => "Fins", "primary" => true}],
              "slug" => "fins"}, "data_updated_at" => "2017-06-12T23:21:17.292652Z",
            "id" => 2, "object" => "radical",
            "url" => "https://www.wanikani.com/api/v2/subjects/2"}]}}
    end

    def request(_path) do
      {:ok,
       %{"data" => %{"character" => "石", "component_subject_ids" => '6',
           "created_at" => "2012-02-29T01:17:03.000000Z",
           "document_url" => "https://www.wanikani.com/kanji/%E7%9F%B3", "level" => 2,
           "meanings" => [%{"meaning" => "Stone", "primary" => true}],
           "readings" => [%{"primary" => false, "reading" => "せき",
              "type" => "onyomi"},
            %{"primary" => true, "reading" => "いし", "type" => "kunyomi"}],
           "slug" => "石"}, "data_updated_at" => "2017-10-04T18:56:22.031932Z",
         "id" => 493, "object" => "kanji",
         "url" => "https://www.wanikani.com/api/v2/subjects/493"}}
    end
  end

  test ".list" do
    params = %{type: "radical", levels: "1,2"}
    {status, body} = Wanikani.Subject.list(params, MockApi)
    assert :ok == status
    assert 2 == Enum.count(body["data"])
  end

  test ".get" do
    {status, body} = Wanikani.Subject.get(493, MockApi)
    assert :ok == status
    assert "https://www.wanikani.com/api/v2/subjects/493" == body["url"]
  end

end