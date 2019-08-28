# Prepare

Role intended to setup rock64.

## TODO

# No overclocked yet
- [Add new overclock point](https://github.com/ayufan-rock64/linux-build/blob/master/recipes/overclocking.md):
  ```bash
  enable_dtoverlay 1398mhz cpu0-opp-table okay "opp-1392000000 {
              opp-hz = /bits/ 64 <1392000000>;
              opp-microvolt = <1350000>;
              opp-microvolt-L0 = <1350000>;
              opp-microvolt-L1 = <1325000>;
              clock-latency-ns = <40000>;
  }"

  # disable
  # enable_dtoverlay 1398mhz cpu0-opp-table okay

  # next one (not added yet)
  #enable_dtoverlay 1512mhz cpu0-opp-table okay "opp-1512000000 {
  #            opp-hz = /bits/ 64 <1512000000>;
  #            opp-microvolt = <1450000 1450000 1450000>;
  #            opp-microvolt-L0 = <1450000 1450000 1450000>;
  #            opp-microvolt-L1 = <1425000 1425000 1450000>;
  #            clock-latency-ns = <40000>;
  #}"
  # Then, force to reload frequency table:

  echo cpufreq-dt > /sys/bus/platform/drivers/cpufreq-dt/unbind
  echo cpufreq-dt > /sys/bus/platform/drivers/cpufreq-dt/bind

  # At very least verify that a new operating point is loaded:

  cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
  # 408000 600000 816000 1008000 1200000 1296000 1392000
  ```

