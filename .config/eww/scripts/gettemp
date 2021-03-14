#!/usr/bin/bb

(println (-> (shell/sh "/usr/bin/sh" "-c" "sensors | grep 'Core 0'")
             :out
             (str/split #"\s+")
             (nth 2)
             (subs 1 5)))
