defmodule AlgorithmsTest.Queue do
  use ExUnit.Case
  doctest Algorithms
  alias Algorithms.Queue

  describe "Algorithms.Queue" do
    test "Algorithms.Queue.start_link: should be :ok and pid" do
      {:ok, pid} = Queue.start_link
      assert :ok == :ok
      assert is_pid(pid)
    end

    test "Algorithms.Queue.enqueue: should be size 4 after 4 call method push" do
      {:ok, pid} = Queue.start_link
      Queue.enqueue pid, 5
      Queue.enqueue pid, 7
      Queue.enqueue pid, 9
      Queue.enqueue pid, 3
      assert Queue.size(pid) == 4
    end
  end
end
