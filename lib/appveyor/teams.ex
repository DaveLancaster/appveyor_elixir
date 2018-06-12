defmodule Appveyor.Teams do
  def add_collaborator(%NewCollaborator{} = collaborator) do
    Appveyor.Endpoints.collaborators
      |> Api.post!(collaborator)
  end

  def add_role(%NewRole{} = role) do
    Appveyor.Endpoints.roles
      |> Api.post!(role)
  end
  
  def add_user(%NewUser{} = user) do
    Appveyor.Endpoints.users
      |> Api.post!(user)    
  end

  def collaborator(user_id) do
    Appveyor.Endpoints.collaborators
      |> Enum.join(to_string(user_id))
      |> Api.fetch()
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def collaborators do
    Appveyor.Endpoints.collaborators
      |> Api.fetch()
      |> Poison.decode!(as: [%Collaborator{}])
  end

  def user(user_id) do
    Appveyor.Endpoints.users
      |> Enum.join(to_string(user_id))
      |> Api.fetch()
      |> Poison.decode!(as: %{"user" => %User{}, "roles" => [%Role{}]})
  end

  def users do
    Appveyor.Endpoints.users
      |> Api.fetch()
      |> Poison.decode!(as: [%User{}])
  end

  def role(role_id) do
    Appveyor.Endpoints.roles
      |> Enum.join(to_string(role_id))
      |> Api.fetch()
      |> Poison.decode!(as: %Role{groups: [%Group{}]})
  end

  def roles do
    Appveyor.Endpoints.roles
      |> Api.fetch()
      |> Poison.decode!(as: [%Role{}])
  end
end
