defmodule Mix.Tasks.Lego.Validate do
  @moduledoc """
  Validates LEGO component usage across the codebase.
  
  ## Usage
  
      mix lego.validate
      mix lego.validate --strict
  
  Options:
    --strict  Fail on warnings as well as errors
  """
  
  use Mix.Task
  
  @shortdoc "Validates LEGO component usage"
  
  # NO classes allowed in templates - empty list
  # @allowed_classes []
  
  # NO utility prefixes allowed - developers must use widgets only
  # @allowed_utility_prefixes []
  
  def run(args) do
    {opts, _} = OptionParser.parse!(args, strict: [strict: :boolean])
    
    Mix.shell().info("Validating LEGO component usage...")
    
    issues = 
      find_heex_files()
      |> Enum.flat_map(&validate_file/1)
    
    if Enum.empty?(issues) do
      Mix.shell().info("✅ All LEGO validations passed!")
    else
      Enum.each(issues, fn {file, line, issue} ->
        Mix.shell().error("#{file}:#{line} - #{issue}")
      end)
      
      if opts[:strict] || has_errors?(issues) do
        Mix.raise("LEGO validation failed!")
      end
    end
  end
  
  defp find_heex_files do
    Path.wildcard("lib/**/*.{heex,ex}")
    |> Enum.reject(&excluded_file?/1)
  end
  
  defp excluded_file?(file) do
    # Exclude email senders, test files, and other non-UI files
    String.contains?(file, [
      "/senders/",
      "/test/",
      "_test.ex",
      "test_live.ex"
    ])
  end
  
  defp validate_file(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.with_index(1)
    |> Enum.flat_map(fn {line, line_num} ->
      validate_line(file, line, line_num)
    end)
  end
  
  defp validate_line(file, line, line_num) do
    issues = []
    
    # Check for ANY CSS classes in templates
    issues = 
      if line =~ ~r/class=/ && !widget_implementation_file?(file) do
        classes = extract_classes(line)
        
        if not Enum.empty?(classes) do
          issue = "CSS classes not allowed in templates. Use widgets only: #{Enum.join(classes, ", ")}"
          [{file, line_num, issue} | issues]
        else
          issues
        end
      else
        issues
      end
    
    # Check for raw HTML elements
    issues = 
      if line =~ ~r/<(div|span|button|input|table|tr|td|th|ul|li|h[1-6]|p|a|img|svg)/ && !widget_implementation_file?(file) do
        issue = "Raw HTML elements not allowed. Use widget components only."
        [{file, line_num, issue} | issues]
      else
        issues
      end
    
    # Check for invalid widget sizes
    issues = 
      if line =~ ~r/size=["']([^"']+)["']/ do
        size = Regex.run(~r/size=["']([^"']+)["']/, line, capture: :all_but_first)
        if size && !valid_size?(hd(size)) do
          [{file, line_num, "Invalid widget size: #{hd(size)}"} | issues]
        else
          issues
        end
      else
        issues
      end
    
    issues
  end
  
  defp extract_classes(line) do
    case Regex.run(~r/class=["']([^"']+)["']/, line) do
      [_, classes] -> String.split(classes)
      _ -> []
    end
  end
  
  defp widget_implementation_file?(file) do
    # Only widget implementation files can use CSS classes
    String.contains?(file, [
      "components/lego/",
      "components/core_components.ex"  # Core components need updating to use widgets
    ])
  end
  
  defp valid_size?(size) do
    # Hardcode valid sizes to avoid circular dependency
    valid_sizes = ~w(1x1 2x1 2x2 3x1 3x2 4x1 4x2 6x1 6x2 12x1 12x2)
    size in valid_sizes
  end
  
  defp has_errors?(issues) do
    Enum.any?(issues, fn {_, _, issue} ->
      String.contains?(issue, ["Invalid", "Unauthorized"])
    end)
  end
end