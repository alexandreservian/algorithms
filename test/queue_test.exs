defmodule AlgorithmsTest.Queue do
  use ExUnit.Case, async: true
  doctest Algorithms
  alias Algorithms.Queue

  setup do
    {:ok, pid} = Queue.start_link
    %{pid: pid}
  end

  describe "Algorithms.Queue" do
    test "Algorithms.Queue.start_link: should be :ok and pid", %{pid: pid} do
      assert is_pid(pid)
    end

    test "Algorithms.Queue.size: should be 0", %{pid: pid}  do
      assert Queue.size(pid) == 0
    end

    test "Algorithms.Queue.size: should be size 4 after 4 call method size", %{pid: pid}  do
      Queue.enqueue pid, 5
      Queue.enqueue pid, 7
      Queue.enqueue pid, 9
      Queue.enqueue pid, 3
      assert Queue.size(pid) == 4
    end

    test "Algorithms.Queue.show: should be [15,17]", %{pid: pid}  do
      Queue.enqueue pid, 15
      Queue.enqueue pid, 17
      assert Queue.show(pid) == [15,17]
    end

    test "Algorithms.Queue.dequeue: should remove last element it's 27", %{pid: pid}  do
      Queue.enqueue pid, 15
      Queue.enqueue pid, 50
      Queue.enqueue pid, 27
      assert Queue.dequeue(pid) == 15
    end

    test "Algorithms.Queue.peek: should return 50", %{pid: pid}  do
      Queue.enqueue pid, 15
      Queue.enqueue pid, 78
      Queue.enqueue pid, 50
      assert Queue.peek(pid) == 15
    end

    test "Algorithms.Queue.isEmpty: should return true", %{pid: pid}  do
      assert Queue.isEmpty(pid) == true
    end

    test "Algorithms.Queue.isEmpty: should return false", %{pid: pid}  do
      Queue.enqueue pid, 19
      assert Queue.isEmpty(pid) == false
    end

    test "Algorithms.Queue.clear: should return []", %{pid: pid}  do
      Queue.enqueue pid, 16
      Queue.enqueue pid, 19
      Queue.enqueue pid, 17
      Queue.enqueue pid, 13
      assert Queue.clear(pid) == []
    end
  end
end
