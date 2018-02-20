defmodule Appveyor do
  def add_project(%NewProject{} = project) do
    Api.post!("/projects/", project)
  end

  def environments do
    Api.fetch("/environments")
      |> Poison.decode!(as: [%Environment{}])
  end
  
  def projects do
    Api.fetch("/projects")
      |> Poison.decode!(as: [%Project{}])
  end
end
