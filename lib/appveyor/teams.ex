defmodule Appveyor.Teams do
  def add_collaborator(%NewCollaborator{} = collaborator) do
      Api.post!("/collaborators", collaborator)
  end

  def add_role(%NewRole{} = role) do
      Api.post!("/roles", role)
  end
  
  def add_user(%NewUser{} = user) do
      Api.post!("/users", user)    
  end

  def collaborator(user_id) do
    "/collaborators" <> to_string(user_id) 
      |> Api.fetch()
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def collaborators do
    "collaborators"
      |> Api.fetch()
      |> Poison.decode!(as: [%Collaborator{}])
  end

  def user(user_id) do
    "/users/" <> to_string(user_id)
      |> Api.fetch()
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def users do
    "/users"
      |> Api.fetch()
      |> Poison.decode!(as: [%User{}])
  end

  def role(role_id) do
    "/roles/" <> to_string(role_id)
      |> Api.fetch()
      |> Poison.decode!(as: %Role{groups: [%Group{}]})
  end

  def roles do
    "/roles"
      |> Api.fetch()
      |> Poison.decode!(as: [%Role{}])
  end
end
