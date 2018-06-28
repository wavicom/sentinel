#!/bin/bash
set -evx

mkdir ~/.wavicore

# safety check
if [ ! -f ~/.wavicore/.wavi.conf ]; then
  cp share/wavi.conf.example ~/.wavicore/wavi.conf
fi
