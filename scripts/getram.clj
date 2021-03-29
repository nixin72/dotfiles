#!/usr/bin/bb

(->> (:out (shell/sh "free" "-m"))
     (re-find #"Mem:.*\n")
     (#(str/split % #"\s+"))
     (#(/ (Integer/parseInt (nth % 2)) (Integer/parseInt (nth % 1)) 0.01))
     (println))

