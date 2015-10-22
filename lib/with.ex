defmodule With do

  # defmacro with(transformer, do: pipeline) do
  defmacro with(do: {:__block__, _, pipeline}) do
    transform_pipe(pipeline)
  end

  defp transform_pipe([final]) do
    final
  end

  defp transform_pipe([{:<-, _, [pattern, expr]} | rest]) do
    quote do
      case unquote(expr) do
        unquote(pattern) ->
          unquote(transform_pipe(rest))
        unmached ->
          unmached
      end
    end
  end

  defp transform_pipe([{:=, _, _} = assign | rest]) do
    quote do
      unquote(assign)
      unquote(transform_pipe(rest))
    end
  end
end
