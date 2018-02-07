defmodule CliTest do
  use ExUnit.Case
  doctest Tokenize

  import Tokenize.CLI, only: [parse_args: 1]

  test "help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "file path is returned if only arg" do
    assert parse_args(["--path", "some/file"]) == [path: "some/file"]
  end
end






