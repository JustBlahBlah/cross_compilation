# Analyze compiled app (Static)
generation date: Thu 29 Oct 18:14:15 GMT 2026

## 1. readelf -h
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 03 00 00 00 00 00 00 00 00 
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - GNU
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           AArch64
  Version:                           0x1
  Entry point address:               0x400840
  Start of program headers:          64 (bytes into file)
  Start of section headers:          847752 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         7
  Size of section headers:           64 (bytes)
  Number of section headers:         24
  Section header string table index: 23

## 2. ldd
	not a dynamic executable

## 3. size
app_static  :
section                size      addr
.note.gnu.build-id       36   4194760
.rela.plt               120   4194800
.init                    28   4194920
.plt                     80   4194960
.text                499688   4195072
.fini                    24   4694760
.rodata              112752   4694784
.eh_frame             60104   4807536
.gcc_except_table       272   4867640
.note.ABI-tag            32   4867912
.tdata                   48   4962880
.tbss                    40   4962928
.init_array              32   4962928
.fini_array              16   4962960
.data.rel.ro          16728   4962976
.got                   1000   4979704
.got.plt                 64   4980712
.data                  6452   4980784
.bss                  22072   4987248
.comment                 31         0
Total                719619



## 4. strings
=== System Environment Info ===
Error: Could not retrieve system information.
Error opening file
