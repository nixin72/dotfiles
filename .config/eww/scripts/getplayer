#!/usr/bin/bb

(-> (:out (shell/sh "playerctl" "-l"))
    (not= "No players were found"))
