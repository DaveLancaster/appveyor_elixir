defmodule Appveyor.Teams do
  def add_collaborator(%NewCollaborator{} = collaborator) do
    Api.post!("/collaborators/", collaborator)
  end

  def add_role(%NewRole{} = role) do
    Api.post!("/roles/", role)
  end
  
  def add_user(%NewUser{} = user) do
    Api.post!("/users/", user)    
  end

  def collaborator(user_id) do
    Api.fetch("/collaborators/" <> to_string(user_id))
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def collaborators do
    Api.fetch("/collaborators")
      |> Poison.decode!(as: [%Collaborator{}])
  end

  def user(user_id) do
    Api.fetch("/users/" <> to_string(user_id))
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def users do
    Api.fetch("/users")
      |> Poison.decode!(as: [%User{}])
  end

  def role(role_id) do
    Api.fetch("/roles/" <> to_string(role_id))
      |> Poison.decode!(as: %Role{groups: [%Group{}]})
  end

  def roles do
    Api.fetch("/roles")
      |> Poison.decode!(as: [%Role{}])
  end
end
