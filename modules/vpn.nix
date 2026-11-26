{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    v2raya
    xray
    wireguard-tools
  ];
  services.v2raya = {
    enable = true;
  };
  systemd.services.v2raya = {
    environment = {
      V2RAYA_V2RAY_BIN = "${pkgs.xray}/bin/xray";
    };
  };
}
