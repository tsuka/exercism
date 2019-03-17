defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]) do
    0
  end

  def count([_|xs]) do
    count(xs) + 1
  end

  @spec reverse(list) :: list
  def reverse(list) do
    reverse(list,[])
  end

  defp reverse([], list) do
    list
  end

  defp reverse([x], list) do
    [x|list]
  end

  defp reverse([x|xs], list) do
    reverse(xs, [x|list])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _) do
    []
  end

  def map([x|xs], f) do
    [f.(x)|map(xs, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _) do
    []
  end

  def filter([x|xs], f) do
    if f.(x) do
      [x|filter(xs, f)]
    else
      filter(xs, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _) do
    acc
  end

  def reduce([x|xs], acc, f) do
    f.(x, reduce(xs, acc, f))
  end

  @spec append(list, list) :: list
  def append([], r) do
    r
  end

  def append([x|xs], r) do
    [x|append(xs, r)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]) do
    []
  end

  def concat([x]) do
    x
  end

  def concat([x|xs]) do
    append(x, concat(xs))
  end
end
