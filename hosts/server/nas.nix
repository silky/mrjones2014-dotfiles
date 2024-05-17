{
  # these are NOT exposed to the internet
  networking.firewall.allowPing = true;
  services = {
    # samba share, allow guest users full access
    # it's only reachable via LAN anyway
    samba = {
      enable = true;
      openFirewall = true;
      extraConfig = ''
        guest account = nobody
        map to guest = Bad User
        load printers = no
        printcap name = /dev/null
        log file = /var/log/samba/client.%I
        log level = 2
      '';
      shares = {
        fileshare = {
          path = "/export/fileshare";
          browseable = "yes";
          writable = "yes";
          public = "yes";
          "read only" = "no";
          "force user" = "nobody";
          "force group" = "users";
          "force directory mode" = "2770";
        };
      };
    };
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
    gvfs.enable = true;
  };
}
