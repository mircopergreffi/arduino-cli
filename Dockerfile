FROM debian:12.6

ARG ARDUINO_CLI_VERSION=1.0.4
ARG ARDUINO_ESP32_VERSION=2.0.17

WORKDIR /usr
RUN apt-get update \
    && apt-get install -y --no-install-recommends bash bash-completion ca-certificates ssh curl tree git python-is-python3 python3 python3-pip python3-serial \
    && apt-get clean
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh -s ${ARDUINO_CLI_VERSION}
RUN arduino-cli config init \
    && arduino-cli core update-index \
    && arduino-cli core install esp32:esp32@${ARDUINO_ESP32_VERSION}