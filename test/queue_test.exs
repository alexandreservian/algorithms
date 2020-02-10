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

    test "Algorithms.Queue.dequeue: should remove last element it's 27" do
      {:ok, pid} = Queue.start_link
      Queue.enqueue pid, 15
      Queue.enqueue pid, 50
      Queue.enqueue pid, 27
      assert Queue.dequeue(pid) == 15
    end

    test "Algorithms.Queue.peek: should return 50" do
      {:ok, pid} = Queue.start_link
      Queue.enqueue pid, 15
      Queue.enqueue pid, 78
      Queue.enqueue pid, 50
      assert Queue.peek(pid) == 15
    end

    test "Algorithms.Queue.isEmpty: should return true" do
      {:ok, pid} = Queue.start_link
      assert Queue.isEmpty(pid) == true
    end

    test "Algorithms.Queue.isEmpty: should return false" do
      {:ok, pid} = Queue.start_link
      Queue.enqueue pid, 19
      assert Queue.isEmpty(pid) == false
    end

    test "Algorithms.Queue.clear: should return []" do
      {:ok, pid} = Queue.start_link
      Queue.enqueue pid, 16
      Queue.enqueue pid, 19
      Queue.enqueue pid, 17
      Queue.enqueue pid, 13
      assert Queue.clear(pid) == []
    end
  end
end
