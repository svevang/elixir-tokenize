defmodule Tokenize do
  @moduledoc """
  Parse english into a series of tokens.
  """

  @doc """
  ## Examples

      iex> Tokenize.tokenize("some list of words")
      ["some", "list", "of", "words"]

      iex> Tokenize.tokenize("some list of words")
      ["some", "list", "of", "words"]

  """
  use Rustler, otp_app: :tokenize, crate: :tokenize

  # When your NIF is loaded, it will override this function.
  def rust_tokenize(_a), do: throw :nif_not_loaded

  def tokenize_file(path: some_path) do
    IO.inspect(some_path)
    file_contents = File.read!(some_path)

    file_contents
    |> rust_tokenize
    |> elem(1)
    |> Enum.map(fn(s) -> String.trim(s) end )
    |> Enum.uniq
    |> Enum.sort
    |> IO.inspect
  end

end
