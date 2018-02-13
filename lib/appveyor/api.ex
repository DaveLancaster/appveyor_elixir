defmodule Api do
  use HTTPoison.Base

  @token System.get_env("APPVEYOR_TOKEN")

  def process_url(url) do
    "https://ci.appveyor.com/api" <> url
  end

  def process_request_headers(headers) do
    headers
      |> Enum.concat([{"Authorization", "Bearer " <> @token}])
  end

  def fetch(endpoint) do
    get!(endpoint).body
  end
end
