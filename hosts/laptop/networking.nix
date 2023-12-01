{ pkgs, ... }:

{
    networking.hostName = "laptop-nixos-flo";
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    networking.firewall.enable = true;
    # Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [ 6006 80 443 ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
}