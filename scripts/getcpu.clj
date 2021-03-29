#!/usr/bin/bb

(->> (:out (shell/sh "top" "-bn1"))
     (re-find #"[0-9\.]+ id")
     (#(subs % 0 2))
     (Integer/parseInt)
     (- 100)
     (println))

