defmodule Appveyor do
  def roles do
    Api.fetch("/roles")
      |> Poison.decode!(as: [%Role{}])
  end

  def projects do
    Api.fetch("/projects")
      |> Poison.decode!(as: [%Project{}])
  end

  def users do
    Api.fetch("/users")
      |> Poison.decode!(as: [%User{}])
  end

  def collaborators do
    Api.fetch("/collaborators")
      |> Poison.decode!(as: [%Collaborator{}])
  end

  def environments do
    Api.fetch("/environments")
      |> Poison.decode!(as: [%Environment{}])
  end

  def user(user_id) do
    Api.fetch("/users/" <> to_string(user_id))
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def collaborator(user_id) do
    Api.fetch("/collaborators/" <> to_string(user_id))
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def role(role_id) do
    Api.fetch("/roles/" <> to_string(role_id))
      |> Poison.decode!(as: %Role{groups: [%Group{}]})
  end
end
