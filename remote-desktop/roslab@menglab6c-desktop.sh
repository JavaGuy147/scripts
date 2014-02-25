#!/bin/bash

ssh -C -f -L 5900:localhost:5900 roslab@menglab6c \
        x11vnc -safer -localhost -nopw -once -display :0 \
        && sleep 5 \
        && open ~/github/scripts/remote-desktop/VNC-Viewer-5.1.0-MacOSX.dmg
#        && vncviewer localhost:0
