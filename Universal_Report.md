# Analyze compiled app (Universal)
generation date: Thu 29 Oct 18:11:00 GMT 2026

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
  Entry point address:               0xa00
  Start of program headers:          64 (bytes into file)
  Start of section headers:          69064 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         10
  Size of section headers:           64 (bytes)
  Number of section headers:         29
  Section header string table index: 28

## 2. ldd
	linux-vdso.so.1 (0x0000007f98b8c000)
	libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007f98960000)
	/lib/ld-linux-aarch64.so.1 (0x0000007f98b50000)

## 3. size
app_universal  :
section              size     addr
.note.gnu.build-id     36      624
.interp                27      660
.gnu.hash              28      688
.dynsym               456      720
.dynstr               201     1176
.gnu.version           38     1378
.gnu.version_r         48     1416
.rela.dyn             192     1464
.rela.plt             336     1656
.init                  28     1992
.plt                  256     2032
.text                 776     2304
.fini                  24     3080
.rodata               454     3104
.eh_frame_hdr          68     3560
.eh_frame             260     3632
.note.ABI-tag          32     3892
.init_array             8   130504
.fini_array             8   130512
.dynamic              480   130520
.got                   48   131000
.got.plt              136   131048
.data                  16   131184
.bss                    8   131200
.comment               31        0
Total                3995



## 4. strings
=== System Environment Info ===
Error: Could not retrieve system information.
Error opening file
