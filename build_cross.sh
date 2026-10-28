#!/bin/bash

set -euo pipefail

CROSS_COMPILE="aarch64-linux-gnu-"
CC="${CROSS_COMPILE}gcc"
CFLAGS="-Wall -Wextra -O2"
SRC="main.c"
BIN="app_target"
REPORT="Target_Report.md"
TEST_FILE="test_log.txt"

TARGET_USER="pi"
TARGET_IP="192.168.0.104"
TARGET_DIR="/home/pi"

echo "=== 3(а): cross compilation with HOST for TARGET ==="
$CC $CFLAGS $SRC -o $BIN
echo "Compiled successfully: $BIN"

file $BIN

echo -e "\n=== 3(б): transfer to TARGET system ==="
scp $BIN $TARGET_USER@$TARGET_IP:$TARGET_DIR/
echo "$BIN has been copied to $TARGET_IP"

echo -e "\n=== 3(в): pefromance test on TARGET ==="
echo "output from target:"
ssh $TARGET_USER@$TARGET_IP "cd $TARGET_DIR && ./$BIN"

echo -e "\nrun with file (first time):"
 ssh $TARGET_USER@$TARGET_IP "cd $TARGET_DIR && ./$BIN $TEST_FILE"

echo -e "\nrun with file (second time to check WARNING):"
ssh $TARGET_USER@$TARGET_IP "cd $TARGET_DIR && ./$BIN $TEST_FILE"

echo -e "\n=== 2(в): analyze bin file with binutils ==="

echo "Generating report"

echo "# Analyze compiled app (Target)" > $REPORT
echo "generation date: $(date)" >> $REPORT

echo -e "\n## 1. readelf -h" >> $REPORT
${CROSS_COMPILE}readelf -h $BIN >> $REPORT

echo -e "\n## 2. ldd" >> $REPORT
ssh $TARGET_USER@$TARGET_IP "ldd $TARGET_DIR/$BIN" >> $REPORT

echo -e "\n## 3. size" >> $REPORT
${CROSS_COMPILE}size -A $BIN >> $REPORT

echo -e "\n## 4. strings" >> $REPORT
${CROSS_COMPILE}strings $BIN | grep "System Environment" >> $REPORT
${CROSS_COMPILE}strings $BIN | grep "Error" >> $REPORT

echo "$REPORT has been successfully generated!"
