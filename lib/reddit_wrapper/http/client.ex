defmodule RedditWrapper.Http.Client do
  use HTTPoison.Base

  def process_request_url(url) when is_bitstring(url) do
    "https://www.reddit.com" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode(keys: :atoms)
  end
end
