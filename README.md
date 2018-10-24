# nginxS3
Docker container to initialize and run nginx with conf.d folder downloaded from AMAZON S3

## Usage
docker run --rm -it -e "S3CONFIGFILE={S3BUCKET}/{zipfilekey.zip}" -e AWS_ACCESS_KEY_ID={S3AccessKeyID} -e AWS_SECRET_ACCESS_KEY={S3keySecret}   labizbille/nginxs3:latest

S3CONFIGFILE : S3Bucket followed by the zipped conf.d folder s3 key. this needs to a zip file

## Details
This container is used to run an nginx container that does not depends on file system and thus is suitable for use in orchestration environments like rancher, swarm, etc.
On startup it downloads the conf.d zip file given in the environment variable from Amazon S3



