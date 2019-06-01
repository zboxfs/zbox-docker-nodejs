# zbox-docker-nodejs

Docker image for building Node.js binding of [ZboxFS].

## How to build this image

Use below command to build the image.

```sh
./build.sh
```

## How to use this image

To use this image build Node.js binding for ZboxFS, first get the latest
code from https://github.com/zboxfs/zbox-nodejs.

```sh
git clone --recursive https://github.com/zboxfs/zbox-nodejs.git
```

Then go inside the cloned folder and use below command to build the Node.j
s binding.

```sh
docker run --rm -v $PWD:/root/zbox zboxfs/nodejs npm run build
```

Now the Node.js binding shared library `native/index.node` is built.

For more details, please visit https://github.com/zboxfs/zbox-nodejs.

[ZboxFS]: https://github.com/zboxfs/zbox
