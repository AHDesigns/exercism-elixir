defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    ls = String.graphemes(to_string dna)

    mapped = List.foldr(ls, "", &convert/2)

    to_charlist mapped
  end

  defp convert(l, rna) do
    map = %{
      "G" => "C",
      "C" => "G",
      "T" => "A",
      "A" => "U",
    }

    map[l] <> rna
  end
end
