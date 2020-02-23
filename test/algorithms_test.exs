defmodule AlgorithmsTest do
  use ExUnit.Case
  import Algorithms
  doctest Algorithms

  describe "decimalToBinary/1" do
    test "should be 0 if number to be 0" do
      assert decimalToBinary(0) == "0"
    end

    test "should be 1 if number to be 1" do
      assert decimalToBinary(1) == "1"
    end

    test "should 1010 0 if number to be 10" do
      assert decimalToBinary(10) == "1010"
    end

    test "should 11000111110 0 if number to be 1598" do
      assert decimalToBinary(1598) == "11000111110"
    end
  end

  describe "isPalindrome/1" do
    test "should be true if number to be 'ovo'" do
      assert isPalindrome("ovo") == true
    end
    test "should be true if number to be 'apos a sopa'" do
      assert isPalindrome("apos a sopa") == true
    end
    test "should be false if number to be 'tigre'" do
      assert isPalindrome("tigre") == false
    end
  end

  describe "factorial/1" do
    test "should return 2 if it's 2" do
      assert factorial(2) == 2
    end
    test "should return 6 if it's 3" do
      assert factorial(3) == 6
    end
    test "should return 1 if it's 0" do
      assert factorial(0) == 1
    end
  end

end
