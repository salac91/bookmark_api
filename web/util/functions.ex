defmodule BookmarkApi.UtilFunctions do
	def count_char_in_string(string, char) do
    string
    |> String.graphemes
    |> Enum.filter(fn(c) -> c == char end)
    |> length
  end
end