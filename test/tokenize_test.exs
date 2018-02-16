defmodule TokenizeTest do
  use ExUnit.Case
  doctest Tokenize

  test "tokenize_file" do

      output = Tokenize.tokenize_file(path: Path.join(__DIR__, '../test/fixtures/test.txt'))
      assert output == ["file", "from", "list", "of", "some", "words"]
  end
end
