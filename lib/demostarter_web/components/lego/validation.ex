defmodule DemostarterWeb.Components.Lego.Validation do
  @moduledoc """
  Compile-time validation for LEGO components.
  """
  
  @valid_sizes ~w(1x1 2x1 2x2 3x1 3x2 4x1 4x2 6x1 6x2 12x1 12x2)
  @valid_themes ~w(default primary secondary accent success warning error)
  
  @doc """
  Validates widget size at compile time.
  Raises compilation error if size is invalid.
  """
  defmacro validate_widget_size!(size) when is_binary(size) do
    unless size in @valid_sizes do
      raise CompileError,
        description: """
        Invalid widget size: #{inspect(size)}
        
        Valid sizes are: #{@valid_sizes |> Enum.join(", ")}
        
        Widget sizes follow the format "columns x rows" where:
        - columns: 1, 2, 3, 4, 6, or 12
        - rows: 1 or 2
        
        Examples: "2x1" (2 columns, 1 row), "4x2" (4 columns, 2 rows)
        """
    end
    quote do: :ok
  end
  
  # Runtime validation for dynamic sizes
  defmacro validate_widget_size!(size) do
    quote do
      unless unquote(size) in unquote(@valid_sizes) do
        raise ArgumentError, """
        Invalid widget size: #{inspect(unquote(size))}
        Valid sizes are: #{unquote(@valid_sizes) |> Enum.join(", ")}
        """
      end
      :ok
    end
  end
  
  @doc """
  Returns list of valid widget sizes.
  """
  def valid_sizes, do: @valid_sizes
  
  @doc """
  Returns list of valid themes.
  """
  def valid_themes, do: @valid_themes
  
  @doc """
  Checks if a size is valid.
  """
  def valid_size?(size), do: size in @valid_sizes
  
  @doc """
  Checks if a theme is valid.
  """
  def valid_theme?(theme), do: theme in @valid_themes
end