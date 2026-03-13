# Git configuration
{...}: {
  programs.ssh.enable = true;

  # Deploy a full SSH config file
  home.file.".ssh/config".text = ''
    Host github.com
        Hostname ssh.github.com
        Port 443
        User git
  '';
  programs.git = {
    enable = true;
    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "*.elc"
      "auto-save-list"
      ".direnv/"
      "node_modules"
      "result"
      "result-*"
    ];
    settings = {
      user = {
        name = "haibaaa";
        email = "9700samarth@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = "false";
      push.autoSetupRemote = true;
      color.ui = "1";
      alias = {
        essa = "push --force";
        co = "checkout";
        fuck = "commit --amend -m";
        c = "commit -m";
        ca = "commit -am";
        forgor = "commit --amend --no-edit";
        graph = "log --all --decorate --graph --oneline";
        oops = "checkout --";
        l = "log";
        r = "rebase";
        s = "status --short";
        ss = "status";
        d = "diff";
        ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
        pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
        af = "!git add $(git ls-files -m -o --exclude-standard | sk -m)";
        st = "status";
        br = "branch";
        df = "!git hist | peco | awk '{print $2}' | xargs -I {} git diff {}^ {}";
        hist = ''
          log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all'';
        llog = ''
          log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative'';
        edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; hx `f`";
      };
    };
  };
}
