#!/bin/bash

set -euo pipefail

CC="gcc"
CFLAGS="-Wall -Wextra -O2"
SRC="main.c"
BIN="app_host"
REPORT="Report.md"
TEST_FILE="test_log.txt"

echo "=== 2(а): HOST compilation ==="
$CC $CFLAGS $SRC -o $BIN
echo "Compiled successfully: $BIN"

echo -e "\n=== 2(б): perfomance test ==="
echo "run without parametrs:"
./$BIN

echo -e "\nrun with file (first time):"
./$BIN $TEST_FILE

echo -e "\nrun with file (second time to check WARNING):"
./$BIN $TEST_FILE

echo -e "\n=== 2(в): analyze bin file with binutils ==="

echo "Generating report"

echo "# Analyze compiled app (HOST)" > $REPORT
echo "generation date: $(date)" >> $REPORT

echo -e "\n## 1. readelf -h" >> $REPORT
readelf -h $BIN >> $REPORT

echo -e "\n## 2. ldd" >> $REPORT
ldd $BIN >> $REPORT

echo -e "\n## 3. size" >> $REPORT
size -A $BIN >> $REPORT

echo -e "\n## 4. strings" >> $REPORT
strings $BIN | grep "System Environment" >> $REPORT
strings $BIN | grep "Error" >> $REPORT

echo "$REPORT has been successfully generated!"
