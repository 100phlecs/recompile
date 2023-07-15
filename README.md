# Recompile

Reproduction:

- `mix compile`
- `elixir load_in_file_exs`
- `mix compile`

On Elixir 1.14.5 it recompiles, while on Elixir 1.15.2 it no longer detects the new file.
