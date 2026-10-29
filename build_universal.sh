#!/bin/bash

set -euo pipefail

CROSS_COMPILE="${CROSS_COMPILE:-}"
CC="${CROSS_COMPILE}gcc"
CFLAGS="-Wall -Wextra -O2"
SRC="main.c"
BIN="app_universal"
REPORT="Universal_Report.md"
TEST_FILE="test_log1.txt"

echo "=== Compiler: $CC ==="

echo "=== Compilation ==="
$CC $CFLAGS $SRC -o $BIN
echo "Compiled successfully: $BIN"

if [ -z "$CROSS_COMPILE" ]; then
echo -e "\n=== Perfomance test ==="
echo "run without parametrs:"
./$BIN

echo -e "\nrun with file (first time):"
./$BIN $TEST_FILE

echo -e "\nrun with file (second time to check WARNING):"
./$BIN $TEST_FILE
else
    echo "Cross-compilation detected. Skipping execution to avoid errors."
fi

echo -e "\n=== Analyze bin file with binutils ==="

echo "Generating report"

echo "# Analyze compiled app (Universal)" > $REPORT
echo "generation date: $(date)" >> $REPORT

echo -e "\n## 1. readelf -h" >> $REPORT
${CROSS_COMPILE}readelf -h $BIN >> $REPORT

echo -e "\n## 2. ldd" >> $REPORT
if [ -z "$CROSS_COMPILE" ]; then
    ldd ./$BIN >> $REPORT 2>&1 || true
else
    echo "ldd unavailable for cross compilation" >> $REPORT
fi

echo -e "\n## 3. size" >> $REPORT
${CROSS_COMPILE}size -A $BIN >> $REPORT

echo -e "\n## 4. strings" >> $REPORT
${CROSS_COMPILE}strings $BIN | grep "System Environment" >> $REPORT
${CROSS_COMPILE}strings $BIN | grep "Error" >> $REPORT

echo "$REPORT has been successfully generated!"
