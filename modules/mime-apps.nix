{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "zen" ];
      "x-scheme-handler/http" = [ "zen" ];
      "x-scheme-handler/https" = [ "zen" ];
      "application/pdf" = "zen";
      "image/png" = "qview";
      "image/jpeg" = "qview";
      "inode/directory" = "thunar";
    };
  };
}
