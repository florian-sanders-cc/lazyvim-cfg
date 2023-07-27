{ pkgs, ... }:

{
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
          vim-nix
          coc-nvim
          vim-airline
          vim-devicons
          vim-polyglot
          auto-pairs
          vim-css-color
          nerdtree
          vim-markdown
          vim-gitgutter
          gruvbox
        ];
      };
}
