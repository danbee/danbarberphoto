DanBarberPhoto
==============

[ ![Codeship Status for danbee/danbarberphoto](https://app.codeship.com/projects/bdd9fe40-63ad-0132-3763-76d0773b13a7/status?branch=master)](https://app.codeship.com/projects/52411)

This is the source code for DanBarberPhoto.com.

The session cookie has been set to `secure: true` so the admin login will only
work over an HTTPS connection. Use the tunnels gem to proxy the development
server to HTTPS:

```bash
# If you're using pow
$ sudo tunnels

# If using rails server
$ sudo tunnels 443 3000
```
