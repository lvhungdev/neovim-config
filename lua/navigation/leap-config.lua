local leap = require("leap")

leap.opts.safe_labels = {
    -- "s", "f", "n", "u", "t",
    -- "S", "F", "N", "L", "H", "M", "U", "G", "T", "Z"
}

leap.opts.labels = {
    "s", "f", "n",
    "j", "k", "l", "h", "o", "d", "w", "e", "i", "m", "b", "u",
    "y", "v", "r", "g", "t", "a", "q", "p", "c", "x", "z",
    -- "S", "F", "N",
    -- "J", "K", "L", "H", "O", "D", "W", "E", "I", "M", "B", "U",
    -- "Y", "V", "R", "G", "T", "A", "Q", "P", "C", "X", "Z"
}
