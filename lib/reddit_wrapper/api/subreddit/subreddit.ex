defmodule RedditWrapper.Subreddit do
  alias RedditWrapper.Http.Requester
  alias RedditWrapper.Structs.Subreddit
  alias RedditWrapper.Structs.Post
  alias RedditWrapper.Common.DataHandler

  def about(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/about.json", :get, params)
    |> DataHandler.handle(Subreddit, :single)
  end

  def about(%Subreddit{} = subreddit, params) do
    about(subreddit.display_name, params)
  end

  def hot_posts(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/hot.json", :get, params)
    |> DataHandler.handle(Post, :list)
  end

  def hot_posts(%Subreddit{} = subreddit, params) do
    hot_posts(subreddit.display_name, params)
  end

  def new_posts(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/new.json", :get, params)
    |> DataHandler.handle(Post, :list)
  end

  def new_posts(%Subreddit{} = subreddit, params) do
    new_posts(subreddit.display_name, params)
  end

  def top_posts(subreddit, params \\ %{}) when is_bitstring(subreddit) do
    Requester.request("/r/" <> subreddit <> "/top.json", :get, params)
    |> DataHandler.handle(Post, :list)
  end

  def top_posts(%Subreddit{} = subreddit, params) do
    top_posts(subreddit.display_name, params)
  end
end
