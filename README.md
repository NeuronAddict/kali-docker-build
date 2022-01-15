# Build your kali inside a docker container

Build kali images with a local cache

- https://www.kali.org/docs/development/dojo-mastering-live-build/
- https://gitlab.com/kalilinux/build-scripts/live-build-config

## Quick start

```
cp .env.example .env
nano .env # customize your .en file
cd overrides && 
docker-compose build --pull && docker-compose run kali-live-build --verbose
```

For build an installer :

```
docker-compose build --pull && docker-compose run kali-live-build --verbose --installer
```

Your images are sorted on the 'images' folder.

## Customize build with profiles

You can use multiples profiles, stored in your /overrides folder.
For example, a profile for your red team config and another for forensic.

All files in overrides/${profile}/ will override files in the live-build-config repo before build.

you can choose a profile with the variable OVERRIDE_PROFILE. You can configure it on .env file

ex: to override file kali-config/variant-default/package-lists/kali.list.chroot on profile default, use the following structure:

overrides/default/kali-config/variant-default/package-lists/kali.list.chroot:
```
# this will replace the file kali-config/variant-default/package-lists/kali.list.chroot
```

Advice : don't commit files inside a copy, you will loose changes on pull.
commit your profile folder and clone it inside overrides

ex:

```
git clone https://github.com/NeuronAddict/kali-docker-build
cd kali-docker-build
cp .env.example .env
docker-compose build --pull
docker-compose run kali-live-build --verbose
```

Now, you can upgrade this repo and your config independently :

```
git pull # update this repo for upgrades
cd overrides/kali-build-example-profile
git pull # now, update the profile (or your profile)
```

## Double cache

You have a cache (on folder cache) that populate packages on first build.

see apt-cacher-ng manual for help: https://www.unix-ag.uni-kl.de/~bloch/acng/html/index.html

You can use a second cache (for example, a server in your local network) in addition to the local cache.

Benefit are that, if you use multiples machines to build images, they can share cache and reduce network traffic and build time when disk cache is not build.

To use the second server, simply set the UPSTREAM_APT_PROXY variable. You must use an apt compatible proxy (apt-cacher-ng or squid for example)./

## troubleshooting

### 503 errors on build

- on one terminal use: docker-compose up apt-cacher-ng
- on Another: docker-compose run kali-live-build --no-deps --verbose

And check logs. The more current cause is an upstream proxy error.
