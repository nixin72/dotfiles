#!/usr/bin/bb

(def data (:out (shell/sh "loginctl")))
(def id (-> (str/split data #"\n")
            (second)
            (str/trim)
            (str/split #" ")
            (first)))

(shell/sh "loginctl" "kill-session" id)
