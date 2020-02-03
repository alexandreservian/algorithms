defmodule AlgorithmsTest do
  use ExUnit.Case
  doctest Algorithms

  describe "Algorithms.decimalToBinary/1" do
    test "shold be 0 if number to be 0" do
      assert Algorithms.decimalToBinary(0) == "0"
    end

    test "shold be 1 if number to be 1" do
      assert Algorithms.decimalToBinary(1) == "1"
    end

    test "shold 1010 0 if number to be 10" do
      assert Algorithms.decimalToBinary(10) == "1010"
    end

    test "shold 11000111110 0 if number to be 1598" do
      assert Algorithms.decimalToBinary(1598) == "11000111110"
    end
  end

  describe "Algorithms.isPalindrome/1" do
    test "shold be true if number to be 'ovo'" do
      assert Algorithms.isPalindrome("ovo") == true
    end
    test "shold be true if number to be 'apos a sopa'" do
      assert Algorithms.isPalindrome("apos a sopa") == true
    end
    test "shold be false if number to be 'tigre'" do
      assert Algorithms.isPalindrome("tigre") == false
    end
  end

end
