defmodule Algorithms.Stack do
  use ExUnit.Case
  doctest Algorithms

  describe "Algorithms.Stack.start_link" do
    test "shold be :ok and pid" do
      {:ok, pid} = Algorithms.Stack.start_link
      assert :ok == :ok
      assert is_pid(pid)
    end
  end



end
