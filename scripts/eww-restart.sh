#!/bin/sh

eww kill
sleep 0.5;
eww daemon;
sleep 1;
eww open-many bar bar2
