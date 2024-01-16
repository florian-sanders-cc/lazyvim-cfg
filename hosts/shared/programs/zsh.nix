{
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        shellAliases = {
            ll = "ls -l -a";
            upd-gnome = "sudo nix flake update '/home/flo/.config/nixos-config' && sudo nixos-rebuild switch --upgrade --flake '/home/flo/.config/nixos-config#laptop-gnome'";
            upd-hypr = "sudo nix flake update '/home/flo/.config/nixos-config' && sudo nixos-rebuild switch --upgrade --flake '/home/flo/.config/nixos-config#laptop-hypr'";
            clean = "sudo nix-collect-garbage -d";
            nxcfg = "cd /home/flo/.config/nixos-config";
            ww = "cd /home/flo/Projects/web";
            setnode = "cat /etc/nixos/.envrc-example > .envrc && direnv allow";
        };
        history = {
            size = 10000;
            path = "$HOME/zsh/history";
        };
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
            theme = "robbyrussell";
        };
        initExtra = ''
            eval "$(direnv hook zsh)"
        '';
    };
}