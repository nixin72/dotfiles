#!/usr/bin/bb

(println (-> (->> *command-line-args* first
                  (shell/sh "df")
                  :out)
             (str/split #"\n")
             (second)
             (str/split #"\s+")
             (nth 4)
             (subs 0 2)))
