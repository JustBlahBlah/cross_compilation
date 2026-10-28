# Analyze compiled app (HOST)
generation date: Wed Oct 28 07:01:04 PM UTC 2026

## 1. readelf -h
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Position-Independent Executable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x12e0
  Start of program headers:          64 (bytes into file)
  Start of section headers:          14528 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         13
  Size of section headers:           64 (bytes)
  Number of section headers:         31
  Section header string table index: 30

## 2. ldd
	linux-vdso.so.1 (0x0000797cf07a8000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x0000797cf0400000)
	/lib64/ld-linux-x86-64.so.2 (0x0000797cf07aa000)

## 3. size
app_host  :
section              size    addr
.interp                28     792
.note.gnu.property     48     824
.note.gnu.build-id     36     872
.note.ABI-tag          32     908
.gnu.hash              36     944
.dynsym               432     984
.dynstr               263    1416
.gnu.version           36    1680
.gnu.version_r         80    1720
.rela.dyn             192    1800
.rela.plt             288    1992
.init                  27    4096
.plt                  208    4128
.plt.got               16    4336
.plt.sec              192    4352
.text                 779    4544
.fini                  13    5324
.rodata               430    8192
.eh_frame_hdr          68    8624
.eh_frame             308    8696
.init_array             8   15712
.fini_array             8   15720
.dynamic              496   15728
.got                  160   16224
.data                  16   16384
.bss                    8   16400
.comment               45       0
Total                4253



## 4. strings
=== System Environment Info ===
Error opening file
Error: Could not retrieve system information.
