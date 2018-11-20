defmodule RedditWrapperTest do
  use ExUnit.Case
  doctest RedditWrapper

  test "greets the world" do
    assert RedditWrapper.hello() == :world
  end
end
