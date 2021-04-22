list = [%{a: 5, b: 2}, %{a: 12, b: 2}, %{a: 86, b: 2}]
Task.async_stream(list, fn element -> IO.puts(element.a) end) |> Stream.run()
