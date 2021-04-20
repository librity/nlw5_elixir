params = %{"name" => "Joe's coffee and dinner", "email" => "cup@joes.yum"}
params |> Inmana.Restaurant.changeset() |> Inmana.Repo.insert()

bad_params = %{"name" => "A", "email" => "bademail"}
bad_params |> Inmana.Restaurant.changeset() |> Inmana.Repo.insert()

bad_params = %{"name" => "  "}
bad_params |> Inmana.Restaurant.changeset() |> Inmana.Repo.insert()
