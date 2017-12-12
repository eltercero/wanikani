defmodule Wanikani.UserTest do
  use ExUnit.Case

  defmodule MockApi do
    def request(_path) do
      {:ok,
       %{"data" => %{"current_vacation_started_at" => nil, "level" => 39,
           "profile_url" => "https://www.wanikani.com/users/eltercero",
           "started_at" => "2016-03-02T09:14:21.072290Z", "subscribed" => true,
           "username" => "eltercero"},
         "data_updated_at" => "2017-12-12T08:11:06.996305Z", "object" => "user",
         "url" => "https://www.wanikani.com/api/v2/user"}}
    end
  end

  test ".get" do
    {status, body} = Wanikani.User.get(MockApi)
    assert :ok == status
    assert "https://www.wanikani.com/api/v2/user" == body["url"]
  end

end