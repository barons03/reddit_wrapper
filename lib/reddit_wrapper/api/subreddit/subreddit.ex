defmodule RedditWrapper.Subreddit do
  alias RedditWrapper.Http.Requester
  alias RedditWrapper.Structs.Subreddit
  alias RedditWrapper.Structs.Post
  alias RedditWrapper.Common.DataHandler

  def about(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/about.json", :get, params)
    |> DataHandler.handle(Subreddit, :single)
  end

  def hot_posts(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/hot.json", :get, params)
    |> DataHandler.handle(Post, :list)
  end

  def new_posts(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/new.json", :get, params)
    |> DataHandler.handle(Post, :list)
  end

  def top_posts(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/top.json", :get, params)
    |> DataHandler.handle(Post, :list)
  end


end