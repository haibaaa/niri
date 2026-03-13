{...}: {
  programs.nvf.settings.vim.notes.neorg = {
    enable = true;
    treesitter.enable = true;
    setupOpts = {
      load = {
        "core.defaults" = {}; # This loads ALL the default modules automatically
        "core.summary" = {};
        "core.concealer" = {};
        "core.dirman" = {
          config = {
            workspaces = {
              notes = "~/stf/notes";
              read = "~/stf/read";
            };
            default_workspace = "notes";
          };
        };
        "core.export" = {
          config = {
            export_dir = "~/stf/notes/exported";
          };
        };
      };
    };
  };
}
