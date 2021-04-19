#!/usr/bin/bb

(def eww-data-path "/tmp/eww/weather")

(defn write [path data]
  (when (not (fs/exists? path))
    (fs/create-file path))
  (spit path data))

(defn write-data [{:keys [temp-real temp-feel condition wind]}]
  (spit (str eww-data-path "/temp-real") temp-real)
  (spit (str eww-data-path "/temp-feel") temp-feel)
  (spit (str eww-data-path "/condition") condition)
  (spit (str eww-data-path "/wind") wind))

(let [data (-> (curl/get "wttr.in/montreal?format=%t;%f;%c;%w")
               (:body)
               (str/split #";"))
      weather {:temp-real (nth data 0)
               :temp-feel (nth data 1)
               :condition (nth data 2)
               :wind (subs (nth data 3) 1)}]
  (when (not (fs/exists? eww-data-path))
    (fs/create-dirs eww-data-path))
  (write-data weather)
  (clojure.pprint/pprint weather))
