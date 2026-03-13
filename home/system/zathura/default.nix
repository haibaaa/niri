# Zathura is a PDF viewer
{
  programs.zathura = {
    enable = true;

    options = {
      guioptions = "v";
      adjust-open = "width";
      statusbar = true;
      statusbar-basename = true;
      info-on-open = true;
      render-loading = false;
      scroll-step = 120;
      "selection-clipboard" = "clipboard";
    };
  };
}
