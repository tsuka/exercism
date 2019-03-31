defmodule RobotSimulator do

  @directions [:north, :east, :south, :west]
  @move %{north: {0, 1}, east: {1, 0}, south: {0, -1}, west: {-1, 0}}

  defguardp is_integer(x, y) when is_integer(x) and is_integer(y)
  defguardp in_directions(direction) when direction in @directions

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, position = {x, y}) when is_integer(x, y) and in_directions(direction) do
    %{direction: direction, position: position}
  end

  def create(direction, _) when in_directions(direction) do
    {:error, "invalid position"}
  end

  def create(_, _) do
    {:error, "invalid direction"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    try do
      String.to_charlist(instructions) |> Enum.reduce(robot, fn c, r ->
        case c do
          ?R -> turn_right(r)
          ?L -> turn_left(r)
          ?A -> advance(r)
          _ -> throw {:error, "invalid instruction"}
        end
      end)
    catch
      err -> err
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    %{direction: direction} = robot
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    %{position: position} = robot
    position
  end

  defp advance(robot = %{direction: direction, position: {x, y}}) do
    {xx, yy} = @move[direction]
    %{robot | position: {x+xx, y+yy}}
  end

  defp turn_right(robot) do
    turn(1, robot)
  end

  defp turn_left(robot) do
    turn(-1, robot)
  end

  defp turn(n, robot = %{direction: direction}) do
    idx = Enum.find_index(@directions, &(&1 == direction))
    %{robot | direction: Enum.at(@directions, Integer.mod(idx+n, 4))}
  end
end
