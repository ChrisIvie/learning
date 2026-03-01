#!/bin/bash 
<<'EOF' 
The memory location are grouped into blocks called pages. The kernal locates each page of memory either in the physical memory or swap space. 

The kernal then maintains a table of the memory pages that indicates which pages are in physical memory and which pages are swappe out to disk. 


The kernal keeps track of which memory pages are in use and automatically copies memory pages that have not been access for a period of time to the swap space area (called swapping out), even if there's other memory available. 
When a program wants to access a memory page that has been swapped out, the kernel must make room for it in physical memory by swapping out a different memory page, and swap in the required page from the swap space. 
Obviously, this process takes time, and can slow down a running process. The process of swapping out memory pages for running application continues for as long as the Linux system is running. 

EOF

echo "You can see the current status of the virutal memory of your linux system by viewing the spical /proc/meminfo file."
echo "Here's an example of a sample proc/meminfo entry:"

cat /proc/meminfo

<<'EOF' 
MemTotal:       16329308 kB - This line show this Linux server has 15GB of physical memory. 
MemFree:         1470744 kB - 1.40 GB not being used 
MemAvailable:   12211248 kB
Buffers:          791784 kB
Cached:          7881448 kB
SwapCached:          132 kB
Active:          5667680 kB
Inactive:        6162512 kB
Active(anon):    2685152 kB
Inactive(anon):   496124 kB
Active(file):    2982528 kB
Inactive(file):  5666388 kB
Unevictable:        1876 kB
Mlocked:               0 kB
SwapTotal:       2097148 kB - 2GB of total swap space memory. 
SwapFree:        2095100 kB
Zswap:                 0 kB
Zswapped:              0 kB
Dirty:                68 kB
Writeback:             0 kB
AnonPages:       3158760 kB
Mapped:           587964 kB
Shmem:             25428 kB
KReclaimable:    2428348 kB
Slab:            2810780 kB
SReclaimable:    2428348 kB
SUnreclaim:       382432 kB
KernelStack:       10912 kB
PageTables:        41116 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:    10261800 kB
Committed_AS:    7354240 kB
VmallocTotal:   34359738367 kB
VmallocUsed:       73516 kB
VmallocChunk:          0 kB
Percpu:            28032 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
Unaccepted:            0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
DirectMap4k:      257088 kB
DirectMap2M:    16476160 kB

By default, each process running on the Linux system has its own private memory pages. One process cannot acccess memory pages being used by another process. 
The Kernal maintains its own memory areas. For security purposes, no process can access memory used by the kernel processes. 

To facilitate data sharing, you can create shared memory pages. Multiple processes can read and write to and from a common shared memory area. 
The kernal maintains and administers the shared memory areas and allows individual processes access to the shared area. 
EOF

echo "The special ipcs command allows you to view the current shared memory pages on the system."
echo "Here's the output from a sample ipcs command:"

ipcs -m