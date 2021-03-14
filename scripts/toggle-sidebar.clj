#!/usr/bin/bb

(-> (shell/sh "eww" "windows")
    (:out)
    (str/split #"\n")
    (#(some #{"*sidebar"} %))
    (if (shell/sh "eww" "close" "sidebar")
      (shell/sh "eww" "open" "sidebar")))

