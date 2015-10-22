# With

Proposed alternative `with` syntax

```elixir
with do
  {:ok, x} <- {:ok, 1}
  y = 2
  {:ok, z} <- {:ok, 2 + 5}
  {:ok, x + y + z}
end
```
