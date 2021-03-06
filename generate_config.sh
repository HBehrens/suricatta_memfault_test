#!/usr/bin/env bash

# adapted from https://github.com/memfault/memfault-yocto/blob/main/meta-memfault-swupdate-example/recipes-support/swupdate/swupdate/09-swupdate-args

CONFIG_PATH=out/swupdate.cfg
TEMPLATE_PATH=swupdate.cfg.template

# Please set the following variables to suit your application's needs.
# For more information, consult the documentation: https://mflt.io/linux-ota-integration-guide
PROJECT_KEY=Fcu6dAS0dv92q1as5KUMxwmcAzNcTc77
SOFTWARE_VERSION=1.0.0
SOFTWARE_TYPE=main
HARDWARE_VERSION=evt

# Note: on a real board you could read /sys/devices/virtual/dmi/id/board_serial
DEVICE_SERIAL=DEMOSERIAL

BASE_URL=https://device.memfault.com

# Only generate the file if it does not exist yet:
# if [ ! -e "$CONFIG_PATH" ]; then
  sed \
  -e "s%\$DEVICE_SERIAL%$DEVICE_SERIAL%g" \
  -e "s%\$PROJECT_KEY%$PROJECT_KEY%g" \
  -e "s%\$SOFTWARE_VERSION%$SOFTWARE_VERSION%g" \
  -e "s%\$SOFTWARE_TYPE%$SOFTWARE_TYPE%g" \
  -e "s%\$HARDWARE_VERSION%$HARDWARE_VERSION%g" \
  -e "s%\$BASE_URL%$BASE_URL%g" \
  $TEMPLATE_PATH > $CONFIG_PATH
# fi

SWUPDATE_SURICATTA_ARGS="--polldelay 60"
SWUPDATE_ARGS="-f $CONFIG_PATH"