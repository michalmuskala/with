defmodule WithTest do
  use ExUnit.Case, async: true

  import With

  test "matching" do
    result =
      with do
        {:ok, x} <- {:ok, 1}
        y = 2
        {:ok, z} <- {:ok, 2 + 5}
        {:ok, x + y + z}
      end

    assert result == {:ok, 10}
  end

  test "not matching" do
    result =
      with do
        {:ok, x} <- {:ok, 1}
        y = 2
        {:ok, z} <- {:error, 123}
        {:ok, x + y + z}
      end

    assert result == {:error, 123}
  end
end
