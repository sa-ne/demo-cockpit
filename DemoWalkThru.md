## Cockpit Demo WalkThru

### Requirements
* Minimum VM: 1vCPU x 1G mem, running RHEL 7.latest
* Setup will create local user for demo

### WalkThru:

* Setup via cockpit-setup.sh
  * Will need root or sudo to install packages
* Open Web Console at https://<hostname>:9090
  * Login as root
* Browse each Tab
  * System
  * Power
  * Performance Profile via tuned
  * Logs -- multiple filters
  * Networking -- teaming, bonding, bridging
  * Accounts
  * Services -- start/stop & enable/disable
  * Diagnostics
    * Fails if sos package is not installed
    ```
    # yum install -y sos
    ```
    * Refresh, Create sosreport, Download
  * Kernel dump config
  * SELinux
    * Fails if package not installed
    ```
    # yum install -y setroubleshoot-server
    ```
    * Refresh
  * Subscriptions
  * Terminal

* Install Plug-Ins
```
# subscription-manager repos --enable=rhel-7-server-extras-rpms
# yum install -y cockpit*
```
* Logout/Log back in
* Notice new or changed tabs
  * System
    * Add ability to Store Performance Data (may have to refresh)
  * Logs -- no change
  * Storage (new) -- LVM (click VG), partitioning (click drive)
  * Networking -- no change
  * Containers (new) -- only if docker installed and running
  * VMs (new) -- only if KVM installed and running
  * Accounts -- no change
  * Services -- no change
  * Diagnostics -- no change
  * Kernel dump config -- no change
  * SELinux -- no change
  * Software Updates (new) -- check and apply errata
  * Subscriptions -- no change
  * Terminal -- no change

* Other
  * Dashboard -- add multiple servers to monitor

* Non-Root User Access
  * Login as cockpituser (password = cockpit)
    * Select “Reuse password” option
  Interesting tabs
    * Logs
    * Service -- restart crond (if fails, make sure user is admin)
    * Terminal
* Cleanup via cockpit-cleanup.sh
  * Optional if demo VM is disposable
