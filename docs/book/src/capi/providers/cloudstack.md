# Building Images for CloudStack

## Hypervisor

The image is built using KVM hypervisor as a `qcow2` image.
Following which, it is then converted into `ova` for VMware and `vhd` for XenServer.

### Prerequisites for building images

Execute the following command to install qemu-kvm and other packages if you are running Ubuntu 18.04 LTS.

#### Installing packages to use qemu-img

```bash
$ sudo -i
# apt install qemu-kvm libvirt-bin qemu-utils
```

If you're on Ubuntu 20.04 LTS, then execute the following command to install qemu-kvm packages.

```bash
$ sudo -i
# apt install qemu-kvm libvirt-daemon-system libvirt-clients virtinst cpu-checker libguestfs-tools libosinfo-bin
```

#### Adding your user to the kvm group

```bash
$ sudo usermod -a -G kvm <yourusername>
$ sudo chown root:kvm /dev/kvm
```

Then exit and log back in to make the change take place.

## Building Images

The build [prerequisites](../capi.md#prerequisites) for using `image-builder` for
building cloudstack images are managed by running:

```bash
cd image-builder/images/capi
make deps-cloudstack
```

### Building CloudStack Images

From the `images/capi` directory, run `make build-cloudstack-xxxx-yyyy`. The image is built and located in images/capi/output/BUILD_NAME+kube-KUBERNETES_VERSION. Please replace xxxx with the OS distribution and yyyy with the OS version depending on WHAT you want to build the image for.

For building a ubuntu-2004 based capi image, run the following commands -

```bash
$ git clone https://github.com/kubernetes-sigs/image-builder.git
$ cd image-builder/images/capi/
$ make build-cloudstack-ubuntu-2004
```
### Prebuilt Images

For convenience, prebuilt images can be found [here](http://download.cloudstack.org/templates/capi/)
