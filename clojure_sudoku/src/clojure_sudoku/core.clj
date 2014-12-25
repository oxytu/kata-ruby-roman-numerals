(ns clojure-sudoku.core)

(defn parse-row
  "Parses a row of a sudoku definition"
  [sudoku-row]
  (map #(if (= \. %)
           nil
           (Integer/parseInt (str %))) sudoku-row))

(defn parse-field
  "Parses a complete sudoku field"
  [field-definition]
  (map parse-row field-definition))

(defn transpose
  "Transposes a field"
  [field]
  (apply map vector field))

(defn map-row-recurse
  "Returns a new field with applied fn to the row row-num"
  [fn row-num current-row field]
  (loop [current-row current-row
         result []
         field-rest field]
    (let [is-last-row (= current-row (count field))
          current-row-contents (atom (first field-rest))]
      (if is-last-row
        result
        (do 
          (if (= row-num current-row)
            (swap! current-row-contents #(map fn %)))
          (recur (inc current-row) (conj result @current-row-contents) (rest field-rest)))))))

(defn map-row
  "Applies fn to sudoku row row-num in field"
  [fn row-num field]
  (map-row-recurse fn row-num 0 field))

(defn map-col
  "Applies fn to sudoku column col-num in field"
  [fn col-num field]
  (transpose
         (map-row fn col-num (transpose field))))

