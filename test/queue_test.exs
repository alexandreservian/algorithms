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

    test "Algorithms.Queue.size: should be 0" do
      {:ok, pid} = Queue.start_link
      assert Queue.size(pid) == 0
    end

    test "Algorithms.Queue.size: should be size 4 after 4 call method size" do
      {:ok, pid} = Queue.start_link
      Queue.enqueue pid, 5
      Queue.enqueue pid, 7
      Queue.enqueue pid, 9
      Queue.enqueue pid, 3
      assert Queue.size(pid) == 4
    end

    test "Algorithms.Queue.show: should be [15,17]" do
      {:ok, pid} = Queue.start_link
      Queue.enqueue pid, 15
      Queue.enqueue pid, 17
      assert Queue.show(pid) == [15,17]
    end
  end
end
