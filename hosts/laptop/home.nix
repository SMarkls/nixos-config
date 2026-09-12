{inputs, ...}:
{
  imports = [
    ../../modules/home.nix
  ];
  
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = ["zen"];
      "x-scheme-handler/http" = ["zen"];
      "x-scheme-handler/https" = ["zen"];
    };
  };
}
