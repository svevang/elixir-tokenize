defmodule Tokenize.CLI do

  @moduledoc """
  Handle the command line parsing and the dispatch to the functions that will
  tokenize the strings.
  """

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be either -h or --help which returns :help

  otherwise it is a path to a file we want to tokenize

  Return a tuple of `{ path }` of `:help` if help was given

  """

  def process(:help) do
    IO.puts """
      Usage: tokenize --path <some/textfile>
    """
  end

  def process({some_path}) do
    IO.puts(some_path)
  end

  def parse_args(argv) do

    parse = OptionParser.parse(argv, switches: [help: :boolean, path: :string], aliases:  [h: :help])

    case parse do
      {[help: true], _,  _ }
        -> :help
      {_, [ file_path ], _}
        -> { file_path }
      _
        -> :help
    end

  end
end

