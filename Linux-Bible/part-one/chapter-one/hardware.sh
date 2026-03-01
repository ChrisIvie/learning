#!/bin/bash 
<<'EOF' 
Still another responsibility for the kernel is the hardware management. Any drvice that the Linux system must communicate with needs driver code inserted inside the kernel code. 
The driver code allows the kernel to pass data back and forth to the device, acting as a middle man between applications and the hardware. 
There are two methods used for inserting device driver code in the Linux kernel: 
- Drivers complied in the kernel
- Driver modules added to the kernel

Previously, the only way to insert device driver code was to recomplie the kernel. Each time you added a new device to the system, you had to recomplie the kernel code. 
This process became even more inefficient as Linux kernels supported more hardware. Fortunately, Linux developers devised a better method to insert driver code into the running kernel.  

The Linux System identifies hardware devices as special files, called device files. There are three different classifications of device files: 
- Character - Character device files are for devices that can only handle data one character at a time. 
- Block - Block files are for devices that can handle data in large blocks at a time, such as disk drives. 
- Network - The network file types are used for devices that use packagets to send and receive data. 

Linux creates special files, called nodes, for each device on the system. All communication with the device is performed through the device node. 
Each node has a unique number pair that identifies it to the Linux kernel. The number pair includes a major and minor device number. 
Similar devices are grouped into the same major device number. The minor device number is used to identify a specific device within the major device group. 

EOF

echo "The following is an example of a few device files on a Linux server:"
cd /dev && ls -al *sda* ttyS*

<< 'EOF' 
The first character of the permissions indicates the type of file. 
^               
|               Major device node number
|                         ^  Minor device node number
|                         |   ^
|                         |   |
brw-rw---- 1 root disk    8,  0 Jan 30 16:25 sda - First ATA hard drive
brw-rw---- 1 root disk    8,  1 Jan 30 16:25 sda1
brw-rw---- 1 root disk    8,  2 Jan 30 16:25 sda2
crw-rw---- 1 root dialout 4, 64 Jan 30 16:25 ttyS0 - ttyS devices are the standard IMB PC com ports
crw-rw---- 1 root dialout 4, 65 Jan 30 16:25 ttyS1
crw-rw---- 1 root dialout 4, 74 Jan 30 16:25 ttyS10
crw-rw---- 1 root dialout 4, 75 Jan 30 16:25 ttyS11
crw-rw---- 1 root dialout 4, 76 Jan 30 16:25 ttyS12
crw-rw---- 1 root dialout 4, 77 Jan 30 16:25 ttyS13
crw-rw---- 1 root dialout 4, 78 Jan 30 16:25 ttyS14
crw-rw---- 1 root dialout 4, 79 Jan 30 16:25 ttyS15
crw-rw---- 1 root dialout 4, 80 Jan 30 16:25 ttyS16
crw-rw---- 1 root dialout 4, 81 Jan 30 16:25 ttyS17
crw-rw---- 1 root dialout 4, 82 Jan 30 16:25 ttyS18
crw-rw---- 1 root dialout 4, 83 Jan 30 16:25 ttyS19
crw-rw---- 1 root dialout 4, 66 Jan 30 16:25 ttyS2
crw-rw---- 1 root dialout 4, 84 Jan 30 16:25 ttyS20
crw-rw---- 1 root dialout 4, 85 Jan 30 16:25 ttyS21
crw-rw---- 1 root dialout 4, 86 Jan 30 16:25 ttyS22
crw-rw---- 1 root dialout 4, 87 Jan 30 16:25 ttyS23
crw-rw---- 1 root dialout 4, 88 Jan 30 16:25 ttyS24
crw-rw---- 1 root dialout 4, 89 Jan 30 16:25 ttyS25
crw-rw---- 1 root dialout 4, 90 Jan 30 16:25 ttyS26
crw-rw---- 1 root dialout 4, 91 Jan 30 16:25 ttyS27
crw-rw---- 1 root dialout 4, 92 Jan 30 16:25 ttyS28
crw-rw---- 1 root dialout 4, 93 Jan 30 16:25 ttyS29
crw-rw---- 1 root dialout 4, 67 Jan 30 16:25 ttyS3
crw-rw---- 1 root dialout 4, 94 Jan 30 16:25 ttyS30
crw-rw---- 1 root dialout 4, 95 Jan 30 16:25 ttyS31
crw-rw---- 1 root dialout 4, 68 Jan 30 16:25 ttyS4
crw-rw---- 1 root dialout 4, 69 Jan 30 16:25 ttyS5
crw-rw---- 1 root dialout 4, 70 Jan 30 16:25 ttyS6
crw-rw---- 1 root dialout 4, 71 Jan 30 16:25 ttyS7
crw-rw---- 1 root dialout 4, 72 Jan 30 16:25 ttyS8
crw-rw---- 1 root dialout 4, 73 Jan 30 16:25 ttyS9

The listing shows all of the sda  devices that were created on the sample Linux system. Not all are actually used, but they are created in case the administrator needs them. 
Similarly, the listing shows all of the ttyS devices created. 