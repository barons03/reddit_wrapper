defmodule RedditWrapper.Common.DataHandler do
  alias RedditWrapper.Common.BodyFormatter

  def handle({:ok, response}, struct, :list) do
    body = BodyFormatter.get_body(response)
    data = BodyFormatter.format_children_data(body)
    {:ok, BodyFormatter.data_to_struct(data, struct(struct), :list)}
  end

  def handle({:ok, response}, struct, :single) do
    body = BodyFormatter.get_body(response)
    data = BodyFormatter.format_data(body)
    {:ok, BodyFormatter.data_to_struct(data, struct(struct), :single)}
  end

  def handle({:error, error}, struct, data_type) do
    {:error, error}
  end
end