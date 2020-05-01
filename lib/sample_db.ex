defmodule SampleDb do
      def inserts() do
          :mnesia.transaction( fn -> :mnesia.write( { :members, 1, "enぺだーし", 49, "有限会社デライトシステムズ", "代表取締役、性能探求者" } ) end )
          :mnesia.transaction( fn -> :mnesia.write( { :members, 2, "ざっきー", 45, "公立大学法人 北九州市立大学", "准教授、カーネルハッカー" } ) end )
          :mnesia.transaction( fn -> :mnesia.write( { :members, 3, "つちろー", 34, "カラビナテクノロジー株式会社", "リードエンジニア、アプリマイスター" } ) end )
          :mnesia.transaction( fn -> :mnesia.write( { :members, 4, "piacere", 43, "カラビナテクノロジー株式会社", "CTO、福岡Elixirプログラマ、重力プログラマ、技術顧問" } ) end )
      end
  end
