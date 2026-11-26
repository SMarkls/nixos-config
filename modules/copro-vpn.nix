{ pkgs, ... }:
let
  vpncScriptWithDnsRoutes = pkgs.writeShellScript "vpnc-script-with-dns-routes" ''
    ${pkgs.vpnc-scripts}/bin/vpnc-script

    case "$reason" in
      connect|reconnect)
        ${pkgs.iproute2}/bin/ip route replace 10.23.0.2/32 dev "$TUNDEV"
        ${pkgs.iproute2}/bin/ip route replace 10.23.0.3/32 dev "$TUNDEV"
        ;;
    esac
  '';
in
{
  environment.systemPackages = with pkgs; [
    openconnect
  ];

  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = with pkgs; [ networkmanager-openconnect ];
  environment.etc."vpnc/vpnc-script".source = vpncScriptWithDnsRoutes;
}
