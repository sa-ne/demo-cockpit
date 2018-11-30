## Cockpit Demo WalkThru

### Requirements
* Minimum VM: 1vCPU x 1G mem, running RHEL 7.latest
* Setup will create local user for demo

### WalkThru:

* Setup via cockpit-setup.sh
  * Will need root or sudo to install packages
* Open Web Console at https://hostname:9090
  * Login as root
* Browse each Tab
  * System -- Note CPU usage, memory usage, disk I/O, and network traffic, as well as hardware and operating system details
    * Power -- Shutdown or Restart
    * Performance Profile via tuned
  * Logs -- See messages produced by the systemd journal, including errors, warnings, and notices. The log is similar to the output of the journalctl command.  Note the ability to apply filters.
  * Networking -- Active graphs of sent and received data, plus recent networking log entries
    * Click thru to current firewall rules
    * Note ability to create team, bond, etc
  * Accounts -- Local accounts with the ability to add accounts.
    * Note: have not tested with IdM or sssd enabled system with external auth source
  * Services -- Really more of a full view of systemd with targets, sockets, etc
    * Click on service = ability to start/stop & enable/disable
  * Diagnostic Reports
    * Click on Create Report
    * Fails if sos package is not installed
    ```
    # yum install -y sos
    ```
    * Refresh page, Click Create Report, takes about 1 min, click Download
  * Kernel Dump -- Shows kdump status and configuration and allows to crash the kernel to test kdump
    * If page shows  "Service has an error" clicking will take you to systemd log entry.  Also hover over "Info" button for potential fix.
  * SELinux -- Shows whether SELinux is enabled and lists access control errors.
    * There will be no details if package not installed
    ```
    # yum install -y setroubleshoot-server
    ```
    * Refresh page, should now see "SELinux Access Control Errors"
    * Extra Credit: generate a SELinux event and then refresh page
    ```
    # work-in-progress need-to-figure-this-out
    ```
  * Subscriptions -- Displays installed Red Hat products and subscriptions, plus status
  * Terminal -- Opens an in-browser terminal with a command line session.  Useful if SSH is not allowed.

* Install Plug-Ins
```
# yum install -y cockpit* --enablerepo=rhel-7-server-extras-rpms
```
* Logout/Log back in
* Notice new or changed tabs
  * System
    * Add ability to Store Performance Data (may have to refresh)
  * Logs -- no change
  * Storage (new)
    * Note: Read/Write stats, Filesystems, NFS, Drives, Recent log entries
    * LVM (click VG), partitioning (click drive)
  * Networking -- no change
  * Containers (new) -- Only if docker installed and running.  Available via cockpit-docker package
  * Virtual Machines (new) -- Only if KVM/libvirt installed and running.  Available via cockpit-machines package
  * Accounts -- no change
  * Services -- no change
  * Diagnostic Reports -- no change
  * Kernel Dump -- no change
  * SELinux -- no change
  * Software Updates (new) -- Check for and apply errata updates.
  * Subscriptions -- no change
  * Terminal -- no change

* Other
  * Dashboard -- Add multiple servers to monitor
  * Extra Credit: add a second VM to view consolidated statistics as well as ability to utilize above tabs on 2nd server from 1st server cockpit interface (e.g. jump server/bastion host)

* Non-Root User Access
  * Login as cockpituser (password = cockpit)
    * Select “Reuse password” option
  * Interesting tabs
    * Logs
    * Service -- restart crond (if fails, make sure user has sudo)
    * Terminal
* Cleanup via cockpit-cleanup.sh
  * Optional if demo VM is disposable
