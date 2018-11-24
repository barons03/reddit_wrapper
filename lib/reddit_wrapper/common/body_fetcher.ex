  defmodule RedditWrapper.Common.BodyFetcher do

    def get_body(%HTTPoison.Response{} = response) do
      response.body
    end
  end