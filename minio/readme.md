## Minio S3 bucket

### install SSL

REF : https://docs.min.io/docs/generate-let-s-encypt-certificate-using-concert-for-minio.html

```
$ sudo docker run -p 443:443 -v /home/user/.minio:/root/.minio/ -v /home/user/data:/data minio/minio server --address ":443" /data
```


### How to set permanent url

- run minio client docker

```
$ docker run -it --entrypoint=/bin/sh minio/mc  
```

- Create alias

```
/ # mc alias set minio http://IP_ADDRESS:9000 USERNAME PASSWORD
mc: Configuration written to `/root/.mc/config.json`. Please update your access credentials.
mc: Successfully created `/root/.mc/share`.
mc: Initialized share uploads `/root/.mc/share/uploads.json` file.
mc: Initialized share downloads `/root/.mc/share/downloads.json` file.
Added `minio` successfully.
```

- ls buckets - `mc ls minio`

```
/ # mc ls minio
[2020-10-31 13:55:32 UTC]     0B assets/
[2020-10-31 13:21:11 UTC]     0B demo/
[2020-10-31 13:55:40 UTC]     0B download/
[2020-10-31 13:55:46 UTC]     0B image/
[2020-10-31 13:55:50 UTC]     0B img/

```

- read current policy - `mc policy get minio/assets`

```
/ # mc policy get minio/assets
Access permission for `minio/assets` is `none`
```

- set policy as download - `mc policy set download minio/assets`

```
/ # mc policy set download minio/assets
Access permission for `minio/assets` is set to `download`
/ # mc policy set download minio/demo
Access permission for `minio/demo` is set to `download`
/ # mc policy set download minio/download
Access permission for `minio/download` is set to `download`
/ # mc policy set download minio/image
Access permission for `minio/image` is set to `download`
/ # mc policy set download minio/img
Access permission for `minio/img` is set to `download`
```