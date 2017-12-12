defmodule Wanikani.Api do
  @url "https://www.wanikani.com/api/v2"

  def request(path, params \\ %{}) do
    encoded_params = URI.encode_query(params)

    case HTTPoison.get("#{@url}/#{path}?#{encoded_params}", request_headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body) }
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %{"message": reason} }
    end
  end

  defp request_headers do
    %{"Authorization" => "Token token=#{api_token()}"}
  end

  defp api_token do
    System.get_env("WANIKANI_API_TOKEN")
  end

end