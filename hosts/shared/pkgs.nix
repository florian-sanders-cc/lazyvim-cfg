{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        chromium
        discord
        firefox-wayland
        htop
        jq
        vlc
        s3cmd
        slack
        discord
        nodejs
        bun
        nvtop
    ];

    fonts.packages = with pkgs; [
        nerdfonts
    ];
}