#!/usr/bin/bb

(println (->> (shell/sh "i3-msg" "-t" "get_workspaces")
              :out
              json/decode
              (map (fn [x] [(dec (x "num")) (x "visible")]))
              (filter (fn [[i x]] x))
              first
              first))
