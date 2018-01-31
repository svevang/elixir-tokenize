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
  def tokenize_file(path: some_path) do
    IO.inspect(some_path)
    file_contents = File.read!(some_path)

    file_contents |> tokenize
    |> Enum.sort
    |> IO.inspect
  end

  # from https://github.com/nicbet/essence/blob/master/lib/essence/tokenizer.ex
  def tokenize(text) do
   text
   |> String.split(~r/\s+/u)
   |> Enum.reduce([], fn(x, acc) -> acc ++ split_without_punctuation(x) end)
  end

  def split_without_punctuation(text) do
    if String.ends_with?(text, "'s'") do
      [text]
    else
      text |> String.split(~r/\pP/u, trim: true)
    end
  end

end
