#!/usr/bin/bb

(println (-> (shell/sh "wmctrl" "-d")
             (:out)
             (str/split #"\n")
             (#(map (fn [x] (take 3 (str/split x #"\s"))) %))
             (#(filter (fn [x] (= (last x) "*")) %))
             (first)
             (first)))

