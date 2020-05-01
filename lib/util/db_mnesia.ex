defmodule DbMnesia do
  def query( table_name ) do
      :mnesia.start
      table_atom = table_name |> String.to_atom
      :mnesia.wait_for_tables( [ table_atom ], 1000 )
      columns = :mnesia.table_info( table_atom, :attributes )
          |> Enum.reduce( [], fn( item, acc ) -> acc ++ [ Atom.to_string( item ) ] end )
      columns_spec = 1..Enum.count( columns )
          |> Enum.reduce( { table_atom }, fn( x, acc ) -> Tuple.append( acc, :"$#{ x }" )  end )
      rows = :mnesia.transaction( fn ->
          :mnesia.dirty_select( table_atom, [ { columns_spec, [], [ :"$$" ] } ] ) end ) |> elem( 1 )
      %{
          columns: columns,
          command: :select,
          connection_id: 0,
          num_rows: Enum.count( rows ),
          rows: rows
      }
  end
end
