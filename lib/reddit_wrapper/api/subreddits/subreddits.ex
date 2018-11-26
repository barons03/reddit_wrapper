defmodule RedditWrapper.Subreddits do

  alias RedditWrapper.Http.Requester
  alias RedditWrapper.Structs.Subreddit
  alias RedditWrapper.Common.DataHandler
  def default(params \\ %{}) do
    Requester.request("/subreddits/default.json", :get, params)
    |> DataHandler.handle(Subreddit, :list)
  end

  def popular(params \\ %{}) do
    Requester.request("/subreddits/popular.json", :get, params)
    |> DataHandler.handle(Subreddit, :list)
  end

end