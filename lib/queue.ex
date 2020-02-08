defmodule Algorithms.Queue do
  def start_link do
    pid = spawn_link(__MODULE__, :loop, [[]])
    {:ok, pid}
  end

  def loop(stack) do
    receive do
      {:enqueue, item} ->
        loop([item | stack])
      {:show, sender} ->
        send sender, {:ok, Enum.reverse(stack)}
      {:size, sender} ->
        send sender, {:ok, Enum.count(stack)}
    end
    loop(stack)
  end
  def enqueue(pid, item) do
    send pid, {:enqueue, item}
  end
  def show(pid)do
    send pid, {:show, self()}
    receive do {:ok, stack} -> stack end
  end
  def size(pid) do
    send pid, {:size, self()}
    receive do {:ok, size} -> size end
  end
end
