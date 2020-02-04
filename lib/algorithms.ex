defmodule Algorithms do
  defp convertBase({0, _}) do
    "0"
  end
  defp convertBase({1, concatBinary}) do
    "1#{concatBinary}"
  end
  defp convertBase({number, concatBinary}) do
    nextNumber = div number, 2
    binary = rem number, 2
    restBinary = "#{binary}#{concatBinary}"
    convertBase({nextNumber, restBinary})
  end

  def decimalToBinary(number) when is_integer(number) do
    convertBase({number, ""})
  end

  def isPalindrome(palindrome) do
    regex = ~r/\s/
    stringWithoutSpace = Regex.replace regex, palindrome, ""
    stringInLowerCase = String.downcase stringWithoutSpace
    stringReverse = String.reverse stringInLowerCase
    stringReverse === stringInLowerCase
  end

  def fizzBuzz(number) do
    cond do
      rem(number,15) == 0 ->
        "FizzBuzz"
      rem(number,3) == 0 ->
        "Fizz"
      rem(number,5) == 0 ->
        "Buzz"
      number ->
        number
    end
  end

  defp fizzBuzzRecursive(number, concatFizzBuzz \\ "", currentNumber \\ 1) do
    regex = ~r/-$/
    cond do
      currentNumber <= number ->
        newValue = fizzBuzz(currentNumber);
        newConcatFizzBizz = "#{concatFizzBuzz}#{newValue}-"
        fizzBuzzRecursive(number, newConcatFizzBizz, currentNumber+1)
      concatFizzBuzz ->
        Regex.replace regex, concatFizzBuzz, ""
    end
  end

  def fizzBuzzCollection(number) do
    fizzBuzzRecursive(number)
  end
end
