# PAM lid check

This is a small shell script that will check if the lid is open or closed along with instructions to integrate it with PAM so that it only asks for fingerprint auth when the lid is open.


## Instructions

1. Install `pam_check_lid` to `/usr/local/bin`
2. Edit `/etc/pam.d/system-auth` and add the following line to the top of the file:

```
auth   [success=ignore default=1]  pam_exec.so quiet /usr/local/bin/pam_check_lid
auth   sufficient                  pam_fprintd.so
auth   required                    pam_unix.so
```