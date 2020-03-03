defmodule AlgorithmsTest.Stack do
  use ExUnit.Case, async: true
  doctest Algorithms
  alias Algorithms.Stack

  setup do
    {:ok, pid} = Stack.start_link
    %{pid: pid}
  end

  describe "Algorithms.Stack" do
    test "Algorithms.Stack.start_link: should be :ok and pid", %{pid: pid} do
      assert is_pid(pid)
    end

    test "Algorithms.Stack.push: should be size 4 after 4 call method push", %{pid: pid} do
      Stack.push pid, 5
      Stack.push pid, 7
      Stack.push pid, 9
      Stack.push pid, 3
      assert Stack.size(pid) == 4
    end

    test "Algorithms.Stack.show: should be [15,17]", %{pid: pid} do
      Stack.push pid, 15
      Stack.push pid, 17
      assert Stack.show(pid) == [15,17]
    end

    test "Algorithms.Stack.pop: should remove last element it's 27", %{pid: pid} do
      Stack.push pid, 15
      Stack.push pid, 50
      Stack.push pid, 27
      assert Stack.pop(pid) == 27
    end

    test "Algorithms.Stack.peek: should return 50", %{pid: pid} do
      Stack.push pid, 15
      Stack.push pid, 78
      Stack.push pid, 50
      assert Stack.peek(pid) == 50
    end

    test "Algorithms.Stack.isEmpty: should return true", %{pid: pid} do
      assert Stack.isEmpty(pid) == true
    end

    test "Algorithms.Stack.isEmpty: should return false", %{pid: pid} do
      Stack.push pid, 19
      assert Stack.isEmpty(pid) == false
    end

    test "Algorithms.Stack.clear: should return []", %{pid: pid} do
      Stack.push pid, 16
      Stack.push pid, 19
      Stack.push pid, 17
      Stack.push pid, 13
      assert Stack.clear(pid) == []
    end
  end

end
