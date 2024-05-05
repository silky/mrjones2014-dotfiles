{ pkgs, ... }: {
  # See https://github.com/nix-community/nix-direnv
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  environment.systemPackages = [ pkgs.mullvad-vpn ];
  services = {
    mullvad-vpn.enable = true;

    # Configure keymap in X11
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # Enable CUPS to print documents.
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  boot = {
    loader = {
      # bootloader
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    wireguard.enable = true;
    # Enable networking
    networkmanager.enable = true;
  };

  environment.etc = {
    "resolved.conf".text = ''
      [Resolve]
      DNS=45.90.28.0#7cac77.dns.nextdns.io
      DNS=2a07:a8c0::#7cac77.dns.nextdns.io
      DNS=45.90.30.0#7cac77.dns.nextdns.io
      DNS=2a07:a8c1::#7cac77.dns.nextdns.io
      DNSOverTLS=yes
    '';
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
}

