#!/usr/bin/awk -f
#
# Reads a single C source file and extracts its "description".
#
# Rule (simple and generic across source files):
#   Capture everything from the start of the file up to (but not
#   including) the first "#include" line -- stripping comment markers

BEGIN {
    captured = ""
    done = 0
}

done { next }

#just to remove blank lines
function emit(text,    trimmed) {
    trimmed = text
    gsub(/^\n+/, "", trimmed)
    gsub(/\n+$/, "", trimmed)
    if (length(trimmed) == 0) {
        print "No description mentioned."
    } else {
        printf "%s\n", trimmed
    }
}

$0 ~ /^ *#include/ {
    done = 1
    emit(captured)
    exit
}

{
    line = $0
    gsub(/\/\*/, "", line)
    gsub(/\*\//, "", line)
	sub(/^\*+/, "", line)
	sub(/^ /, "", line)
    captured = captured line "\n"
    next
}

END {
    if (!done) {
        emit(captured)
    }
}
