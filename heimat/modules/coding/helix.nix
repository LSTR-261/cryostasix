{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox-material"; #term16_dark
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        line-number = "relative";
        gutters = ["diff" "line-numbers" "spacer" "diagnostics"];
        indent-guides.render = true;
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "warning";
      };
      keys.normal = {
        C-g = [":write-all" ":insert-output lazygit >/dev/tty" ":redraw" ":reload-all"];
        C-e = [":new" ":insert-output yazi" ":buffer-close!" ":redraw"];
        C-r = [":write-all" ":insert-output scooter" ":redraw" ":reload-all"];
        space.q = ":q";
      };
      keys.insert = {
        C-s = [":write-all"];
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "alejandra";
        language-servers = ["nixd"];
      }
      {
        name = "markdown";
        auto-format = true;
        language-servers = ["markdown-oxide"];
        soft-wrap.enable = true;
        text-width = 80;
        soft-wrap.wrap-at-text-width = true;
      }
      {
        name = "typst";
        language-servers = ["tinymist"];
      }
    ];
    languages.language-server = {
      tinymist = {
        command = "tinymist";
        config = {
          exportPdf = "onType";
          outputPath = "$root/target/$dir/$name";
          preview.background = {
            enabled = true;
            args = ["--data-plane-host=127.0.0.1:23635" "--invert-colors=never" "--open"];
          };
        };
      };
    };
  };
}
