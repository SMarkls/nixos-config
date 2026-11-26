{ inputs, ... }:
{
  imports = [
    ../../modules/home.nix
  ];

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "chromium" ];
    "x-scheme-handler/http" = [ "chromium" ];
    "x-scheme-handler/https" = [ "chromium" ];
  };
}
