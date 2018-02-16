defmodule Tokenize do
  @moduledoc """
  Parse english into a series of tokens.
  """
  use Rustler, otp_app: :tokenize, crate: :tokenize

  @doc """
  ## Example

      iex> Tokenize.rust_tokenize("some list of words")
      { :ok, ["some", "list", "of", "words"] }

  """
  # When your NIF is loaded, it will override this function.
  def rust_tokenize(_a), do: throw :nif_not_loaded

  def tokenize_file(path: some_path) do
    file_contents = File.read!(some_path)

    file_contents
    |> rust_tokenize
    |> elem(1)
    |> Enum.map(fn(s) -> String.trim(s) end )
    |> Enum.uniq
    |> Enum.sort
  end

end
