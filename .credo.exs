%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "test/"],
        excluded: [~r"/_build/", ~r"/deps/"]
      },
      checks: [
        # ... existing checks ...
        
        # LEGO System Checks
        {CredoChecks.LegoComponentCheck, []},
      ]
    }
  ]
}