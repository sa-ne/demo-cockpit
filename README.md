# demo-cockpit

Quick demo of Cockpit web-based management

Cockpit is a user-friendly web-based interface for administering servers. It allows monitoring system resources and adjusting configuration with ease.

### Notes
* RHEL 7 only, no RHEL 6 or below
* Cockpit does not need special infrastructure or configuration. Once installed, it is ready to use
* When not in use, Cockpit uses no memory or CPU on the server
* Cockpit stores no data or policy. People keep their system-wide permissions and use the system credentials

### Installation & Config
```
      # yum install -y cockpit 		(also installs -bridge, -system, -ws)
      # systemctl enable cockpit.socket
      # firewall-cmd --permanent --add-service cockpit
      # firewall-cmd --reload
      # systemctl start cockpit
```

### References and Resources
* [Red Hat Documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/getting_started_with_cockpit/)
* [Red Hat Blog Post](https://www.redhat.com/en/blog/linux-system-administration-management-console-cockpit?utm_medium=Email&utm_campaign=weekly&sc_cid=701f2000000tpY4AAI)
