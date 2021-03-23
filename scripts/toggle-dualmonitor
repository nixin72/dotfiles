#!/usr/bin/bb
;; -*- clojure -*-

(defn switch-to-laptop []
  "xrandr --output DVI-I-2-2 --off")

(defn switch-to-monitors []
  "xrandr --output DVI-I-2-2 --auto --right-of DVI-I-1-1")

(let [monitors (->> (:out (shell/sh "xrandr" "--listmonitors"))
                    (re-find #"Monitors: \d")
                    (last)
                    (Integer/parseInt))]
  (if (> monitors 1)
    (-> (if (> monitors 1) (switch-to-monitors) (switch-to-laptop))
        (str/split #"\s")
        (#(apply shell/sh %)))))
