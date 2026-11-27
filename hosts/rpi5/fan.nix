{ pkgs, ... }:

{
  systemd.services.argon-fan = {
    description = "Argon ONE V3 CPU fan control";
    wantedBy = [ "multi-user.target" ];
    after = [ "systemd-modules-load.service" ];
    path = [ pkgs.i2c-tools ];

    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
    unitConfig.StartLimitIntervalSec = 0;

    script = ''
      bus=1
      address=0x1a
      speed_register=0x80
      hysteresis=3000
      thresholds=(0 55000 60000 65000)
      speeds=(0 30 55 100)
      level=0
      applied_speed=-1

      while true; do
        temperature=
        for zone in /sys/class/thermal/thermal_zone*; do
          if [[ -r "$zone/type" ]] && [[ $(<"$zone/type") == cpu-thermal ]]; then
            if [[ -r "$zone/temp" ]]; then
              read -r temperature < "$zone/temp" || temperature=
            fi
            break
          fi
        done

        if [[ $temperature =~ ^[0-9]+$ ]]; then
          while (( level < ''${#speeds[@]} - 1 && temperature >= thresholds[level + 1] )); do
            level=$((level + 1))
          done
          while (( level > 0 && temperature <= thresholds[level] - hysteresis )); do
            level=$((level - 1))
          done
          speed=''${speeds[level]}
        else
          speed=100
        fi

        if (( speed != applied_speed )); then
          i2cset -y "$bus" "$address" "$speed_register" "$speed" b
          echo "Argon ONE V3 fan set to $speed%"
          applied_speed=$speed
        fi

        sleep 5
      done
    '';
  };
}
