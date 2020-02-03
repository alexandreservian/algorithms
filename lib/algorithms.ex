defmodule Algorithms do
  defp convertBase({0, concatBinary}) do
    "0#{concatBinary}"
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
end
