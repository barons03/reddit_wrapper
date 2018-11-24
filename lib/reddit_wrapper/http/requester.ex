defmodule RedditWrapper.Http.Requester do
  alias RedditWrapper.Http.Client

  def request(url) do
    request(url, :get)
  end

  def request(url, :get) when is_bitstring(url) do
    case Client.get(url) do
      {:ok, response} ->
        case response.status_code do
          200 ->
            case response.body do
              {:ok, json_data} ->
                response
                |> Map.put(:body, json_data)
              {:error, error} -> {:error, error}
            end
          _ ->
            {:error, response}
        end
      {:error, error} -> {:error, error}
    end
  end
end
