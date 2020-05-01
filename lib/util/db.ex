defmodule Db do
  def query( sql ) when sql != "" do
      Regex.named_captures( ~r/select( *)(?<columns>.*)( *)from( *)(?<tables>.*)/, sql )[ "tables" ]
      |> DbMnesia.query
  end
  def columns_rows( result ) do
      result
      |> rows
      |> Enum.map( fn row -> Enum.into( List.zip( [ columns( result ), row ] ), %{} ) end )
  end
  def rows( %{ rows: rows } = _result ), do: rows
  def columns( %{ columns: columns } = _result ), do: columns
end
