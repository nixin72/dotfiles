#!/usr/bin/bb

(->> (:out (shell/sh "amixer" "get" "Master")) 
     (re-find #"\[\d+%")
     (#(subs % 1 (dec (count %))))
     (println))
