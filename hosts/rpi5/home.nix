{inputs, ...}:
{
  imports = [
    ../../modules/home.nix
  ];
  
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = ["chromium"];
      "x-scheme-handler/http" = ["chromium"];
      "x-scheme-handler/https" = ["chromium"];
    };
  };
}
