# WAVI Sentinel

An all-powerful toolset for WAVI.

[![Build Status](https://travis-ci.org/dashpay/sentinel.svg?branch=master)](https://travis-ci.org/dashpay/sentinel)

Sentinel is an autonomous agent for persisting, processing and automating WAVI V12.2.4 governance objects and tasks, and for expanded functions in the upcoming WAVI V13 release (Evolution).

Sentinel is implemented as a Python application that binds to a local version 12.2.4 wavid instance on each WAVI V12.2.4 Masternode.

This guide covers installing Sentinel onto an existing 12.2.4 Masternode in Ubuntu 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv virtualenv

Make sure the local WAVI daemon running is at least version 12.2.4 (120204)

    $ wavi/wavi-cli getinfo | grep version

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/wavicom/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/root/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /root/sentinel && SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py >> sentinel.log 2>&1

### 4. Test the Configuration

Test the config by runnings all tests from the sentinel folder you cloned into

    $ ./venv/bin/py.test ./test

With all tests passing and crontab setup, Sentinel will stay in sync with wavid and the installation is complete

## Configuration

An alternative (non-default) path to the `wavi.conf` file can be specified in `sentinel.conf`:

    wavi_conf=/path/to/wavi.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py

### License

Released under the MIT license, under the same terms as WaviCore itself. See [LICENSE](LICENSE) for more info.
