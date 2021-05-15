defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = Regex.scan(~r/[[:alnum:]-]+/u, sentence)
            |> List.flatten
            |> Enum.map &(String.downcase &1)

    List.foldl(words, %{}, &increment_map/2)
  end

  defp increment_map(word, counts) do
    Map.update(counts, word, 1, &(1 + &1))
  end
end
