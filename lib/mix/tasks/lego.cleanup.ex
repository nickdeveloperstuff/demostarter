defmodule Mix.Tasks.Lego.Cleanup do
  @moduledoc """
  Identifies old CSS patterns that should be migrated to LEGO system.
  """
  
  use Mix.Task
  
  @shortdoc "Find CSS patterns to migrate to LEGO system"
  
  def deprecated_patterns do
    [
      {~r/grid-cols-\d+/, "Use lego-container instead"},
      {~r/flex\s+flex-col/, "Use lego-widget structure"},
      {~r/space-[xy]-\d+/, "Use lego-gap utilities"},
      {~r/p-\d+/, "Use lego-pad-* utilities"},
      {~r/m-\d+/, "Use lego-space-* utilities"},
    ]
  end
  
  def run(_) do
    Mix.shell().info("Scanning for deprecated CSS patterns...")
    
    issues = find_deprecated_patterns()
    
    if Enum.empty?(issues) do
      Mix.shell().info("✅ No deprecated patterns found!")
    else
      Mix.shell().info("\nFound #{length(issues)} deprecated patterns:\n")
      
      Enum.each(issues, fn {file, line_num, pattern, suggestion} ->
        Mix.shell().info("#{file}:#{line_num}")
        Mix.shell().info("  Pattern: #{pattern}")
        Mix.shell().info("  Suggestion: #{suggestion}\n")
      end)
    end
  end
  
  defp find_deprecated_patterns do
    Path.wildcard("lib/**/*.{heex,ex}")
    |> Enum.flat_map(&scan_file/1)
  end
  
  defp scan_file(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.with_index(1)
    |> Enum.flat_map(fn {line, line_num} ->
      check_line(file, line, line_num)
    end)
  end
  
  defp check_line(file, line, line_num) do
    Enum.flat_map(deprecated_patterns(), fn {pattern, suggestion} ->
      if line =~ pattern do
        matches = Regex.scan(pattern, line)
        Enum.map(matches, fn [match] ->
          {file, line_num, match, suggestion}
        end)
      else
        []
      end
    end)
  end
end