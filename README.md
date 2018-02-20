# Appveyor

Simple Elixir wrapper for the Appveyor CI API

## Resources

* Environments
* Users
* Roles
* Groups
* Projects
* Collaborators

## Usage

```elixir
iex(1)> Appveyor.Teams.collaborators |> List.first |> Map.take([:fullName, :email])
%{email: "foo@bar.com", fullName: "John Smith"}
```

## Testing

To run the tests use:

```elixir
mix test
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `appveyor` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:appveyor, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/appveyor](https://hexdocs.pm/appveyor).

