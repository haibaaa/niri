{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "nvim-biscuits" = {
      package = pkgs.vimPlugins.nvim-biscuits;
      setupOpts = {};
    };
    "twilight.nvim" = {
      package = pkgs.vimPlugins.twilight-nvim;
      setupOpts = {
        context = 4;
      };
    };
    "leetcode.nvim" = {
      package = pkgs.vimPlugins.leetcode-nvim;
      setupOpts = {
        arg = "leetcode.nvim";
        lang = "cpp";
        cn = {
          enabled = false;
          translator = true;
          translate_problems = true;
        };
        storage = {
          home = "vim.fn.stdpath('data') .. '/leetcode'";
          cache = "vim.fn.stdpath('cache') .. '/leetcode'";
        };
        plugins = {
          non_standalone = true;
        };
        logging = true;
        injector = {};
        cache = {
          update_interval = 60 * 60 * 24 * 7;
        };
        editor = {
          reset_previous_code = true;
          fold_imports = true;
        };
        console = {
          open_on_runcode = true;
          dir = "row";
          size = {
            width = "90%";
            height = "75%";
          };
          result = {
            size = "60%";
          };
          testcase = {
            virt_text = true;
            size = "40%";
          };
        };
        description = {
          position = "left";
          width = "70%";
          show_stats = true;
        };
        picker = {
          provider = null;
        };
        keys = {
          toggle = ["q"];
          confirm = ["<CR>"];
          reset_testcases = "r";
          use_testcase = "U";
          focus_testcases = "H";
          focus_result = "L";
        };
        theme = {};
        image_support = false;
      };
      after = ''
        require("leetcode").setup(opts)

        -- Global keybindings
        vim.keymap.set("n", "<leader>ll", ":Leet list<CR>", { desc = "LeetCode: List problems" })
        vim.keymap.set("n", "<leader>ld", ":Leet desc<CR>", { desc = "LeetCode: Show description" })
        vim.keymap.set("n", "<leader>lr", ":Leet run<CR>", { desc = "LeetCode: Run code" })
        vim.keymap.set("n", "<leader>lt", ":Leet test<CR>", { desc = "LeetCode: Test with input" })
        vim.keymap.set("n", "<leader>lp", ":Leet submit<CR>", { desc = "LeetCode: Submit solution" })
        vim.keymap.set("n", "<leader>lc", ":Leet console<CR>", { desc = "LeetCode: Open console" })
        vim.keymap.set("n", "<leader>lm", ":Leet menu<CR>", { desc = "LeetCode: menu" })
      '';
    };
  };

  # Dependencies go in extraPlugins
  programs.nvf.settings.vim.extraPlugins = {
    plenary-nvim = {
      package = pkgs.vimPlugins.plenary-nvim;
    };
    nui-nvim = {
      package = pkgs.vimPlugins.nui-nvim;
    };
    zen-mode-nvim = {
      package = pkgs.vimPlugins.zen-mode-nvim;
    };
  };
}
