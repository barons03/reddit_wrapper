defmodule RedditWrapper.Common.BodyFormatter do
  def get_body(%HTTPoison.Response{} = response) do
    response.body
  end

  def format_data(body) do
    body.data
  end

  def format_children(body) do
    format_data(body).children
  end

  def format_children_data(body) do
    format_children(body)
    |> Enum.map(fn(children) ->
      format_data(children)
    end)
  end

  def data_to_struct(data, struct, :single) when is_map(data) do
    struct(struct, data)
  end

  def data_to_struct(data, struct, :list) do
    data
    |> Enum.map(fn(child) ->
      data_to_struct(child, struct, :single)
    end)
  end
end