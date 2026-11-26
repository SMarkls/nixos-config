{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  environment.systemPackages = with pkgs; [
    virt-viewer
    virtio-win
    qemu-utils
    usbutils
  ];

  users.users.mark.extraGroups = [
    "libvirtd"
    "kvm"
  ];
}
