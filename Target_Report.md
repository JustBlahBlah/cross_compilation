# Analyze compiled app (Target)
generation date: Wed Oct 28 07:27:41 PM UTC 2026

## 1. readelf -h
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Position-Independent Executable file)
  Machine:                           AArch64
  Version:                           0x1
  Entry point address:               0xb40
  Start of program headers:          64 (bytes into file)
  Start of section headers:          69112 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         9
  Size of section headers:           64 (bytes)
  Number of section headers:         28
  Section header string table index: 27

## 2. ldd
	linux-vdso.so.1 (0x0000007f9598c000)
	libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007f95760000)
	/lib/ld-linux-aarch64.so.1 (0x0000007f95950000)

## 3. size
app_target  :
section              size     addr
.interp                27      568
.note.gnu.build-id     36      596
.note.ABI-tag          32      632
.gnu.hash              28      664
.dynsym               528      696
.dynstr               286     1224
.gnu.version           44     1510
.gnu.version_r         80     1560
.rela.dyn             216     1640
.rela.plt             384     1856
.init                  24     2240
.plt                  288     2272
.text                 856     2560
.fini                  20     3416
.rodata               454     3440
.eh_frame_hdr          68     3896
.eh_frame             248     3968
.init_array             8   130336
.fini_array             8   130344
.dynamic              512   130352
.got                  208   130864
.data                  16   131072
.bss                    8   131088
.comment               45        0
Total                4424



## 4. strings
=== System Environment Info ===
Error: Could not retrieve system information.
Error opening file
