defmodule Algorithms.Stack do
  def start_link do
    pid = spawn_link(__MODULE__, :loop, [[]])
    {:ok, pid}
  end

  def loop(stack) do
    receive do
      {:push, item} ->
        loop([item | stack])
      {:show, sender} ->
        send sender, {:ok, Enum.reverse(stack)}
      {:size, sender} ->
        send(sender, {:ok, Enum.count(stack)})
      {:pop, sender} ->
        [head | tail] = stack
        send(sender, {:ok, head})
        loop(tail)
      {:peek, sender} ->
        [head | _] = stack
        send(sender, {:ok, head})
      {:isEmpty, sender} ->
        send(sender, {:ok, Enum.empty?(stack)})
      {:clear, sender} ->
        send(sender, {:ok, []})
        loop([])
    end
    loop(stack)
  end

  def push(pid, item) do
    send pid, {:push, item}
  end
  def show(pid) do
    send pid, {:show, self()}
    receive do {:ok, stack} -> stack end
  end
  def size(pid) do
    send pid, {:size, self()}
    receive do {:ok, size} -> size end
  end
  def pop(pid) do
    send pid, {:pop, self()}
    receive do {:ok, itemDeleted} -> itemDeleted end
  end
  def peek(pid) do
    send pid, {:peek, self()}
    receive do {:ok, lastItem} -> lastItem end
  end
  def isEmpty(pid) do
    send pid, {:isEmpty, self()}
    receive do {:ok, isEmpty} -> isEmpty end
  end
  def clear(pid) do
    send pid, {:clear, self()}
    receive do {:ok, stack} -> stack end
  end
end
