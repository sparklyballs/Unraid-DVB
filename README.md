#Unraid-DVB

In order to use TVHeadEnd or MythTV with PCIe or USB DVB Tuners you need to run a special Unraid build which contains the necessary drivers.  

This replaces the Unraid bzroot and bzimage files (the OS) with newly created ones that have drivers for DVB hardware incorporated.

These are not necessary if you use Homerun or IPTV devices.

##There are three steps necessary to getting a PVR Solution running on your Unraid Machine

1.  Installation Of DVB files
2.  Installation Of DVB Plugin (Only necessary for TVHeadEnd & MythTV Dockers - Not required for TVHeadEnd Plugin)
3.  Installation Of PVR Software: TVHeadEnd Docker, TVHeadEnd Plugin or MythTV Docker

##Installation Of DVB files

1.  Navigate to the root of your USB flash drive and rename bzroot, bzroot-gui & bzimage to bzroot-original, bzroot-gui-original & bzimage-original.
2.  Download the MediaBuild files and copy the new bzroot, bzroot-gui & bzimage into the root of your USB flash drive.
3.  Reboot
