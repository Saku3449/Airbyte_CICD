resource "airbyte_source_pokeapi" "my_source_pokeapi" {
  configuration = {
    pokemon_name = "snorlax"
    source_type  = "pokeapi"
  }
  name         = "PokeAPI"
  workspace_id = var.workspace_id
}
