# S3FS_DOCKER

This Docker uses a Debian image and its installation and configuration  is describe in [s3fs-fuse repo]

You'll need 3 environment variables:

- AWS_ACCESS_KEY
- AWS_SECRET_KEY
- BUCKET (bucket name you want to mount locally)

#Example

```docker run -d --device=/dev/fuse -e BUCKET=<bucket_name> -e AWS_ACCESS_KEY=<your_aws_access_key> -e AWS_SECRET_KEY=<your_aws_secret_key> --privileged=true devopsbq/s3fs-:1.78```

[s3fs-fuse repo]: https://github.com/s3fs-fuse/s3fs-fuse/wiki/Installation-Notes
