defmodule RedditWrapper.Common.Enum do
  def each_get(list, key_list) when is_list(list) do
    Enum.map(list, fn(data) ->
     Map.take(data, key_list)
    end)
  end
end