{ pkgs, ... }: {

  imports =
    [ ./hardware-configuration.nix ./ollama.nix ./nginx.nix ./samba.nix ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
  };
  networking = {
    hostName = "nixos-server";
    networkmanager.enable = true;
  }; # Easiest to use and most distros use this by default.
  time.timeZone = "America/New_York";

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

  networking.firewall.enable = true;
  services = {
    openssh = {
      enable = true;
      settings = {
        # only allow SSH key auth
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "mat" ];
      };

      ports = [ 6969 ];
    };

    jellyfin = {
      enable = true;
      # see: https://jellyfin.org/docs/general/networking/index.html
      # ports are:
      # TCP: 8096, 8920
      # UDP: 1900 7359
      openFirewall = true;
    };
  };

  # enable vaapi on OS-level
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
    ];
  };
  programs.fish.enable = true;

  users = {
    mutableUsers = false;
    users = {
      mat = {
        shell = pkgs.fish;
        isNormalUser = true;
        # generated by `mkpasswd`
        hashedPassword =
          "$y$j9T$L.RrmE3CRSB.lQayiw2ZN/$vA4XkSR13yL016t3HaZ11uCN/sCmXqBcuUcSBxMjiPD";
        home = "/home/mat";
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDsT6GLG7sY8YKX7JM+jqS3EAti3YMzwHKWViveqkZvu"
        ];
      };
    };
  };
}
