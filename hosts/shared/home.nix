{ config, pkgs, inputs, hyprland, ... }:

{

    # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "flo";
  home.homeDirectory = "/home/flo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

    
    imports = [
        ./programs/git.nix
        ./programs/alacritty.nix
        ./programs/fzf.nix
        ./programs/starship.nix
        ./programs/direnv.nix
        #./programs/vscode.nix
        ./programs/zsh.nix
        ./programs/neovim.nix
        ./programs/syncthing.nix
        ./programs/hyprland.nix
    ];

    home.sessionVariables = {
      NPM_PREFIX = "$HOME/.npm-packages";
      PATH = "$HOME/.npm-packages/bin:$PATH";
      NODE_PATH = "$HOME/.npm-packages/lib/node_modules";
      NIXOS_OZONE_WL= "1";
    };

}
