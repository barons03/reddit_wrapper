defmodule RedditWrapper.Http.Requester do
  alias RedditWrapper.Http.Client

  def request(url, :get, parameters \\ %{}) when is_bitstring(url) do
    case Client.get(url <> "?" <> map_to_url_query_parameters(parameters)) do
      {:ok, response} ->
        case response.status_code do
          200 ->
            case response.body do
              {:ok, json_data} ->
                response = response
                |> Map.put(:body, json_data)
                {:ok, response}
              {:error, error} -> {:error, error}
            end
          _ ->
            {:error, response}
        end
      {:error, error} -> {:error, error}
    end
  end

  def map_to_url_query_parameters(parameters) when is_map(parameters) do
    URI.encode_query(parameters)
  end
end
