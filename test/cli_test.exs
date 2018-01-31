defmodule CliTest do
  use ExUnit.Case
  doctest Tokenize

  import Tokenize.CLI, only: [parse_args: 1]

  test "help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "file path is returned if ony arg" do
    assert parse_args(["some/file"]) == { "some/file" }
  end
end






