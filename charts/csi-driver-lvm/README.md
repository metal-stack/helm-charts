# CSI Driver LVM Helm Chart

## TL;DR

```bash
helm install csi-driver-lvm csi-driver-lvm -n csi-driver-lvm --repo https://helm.metal-stack.io/csi-driver-lvm --set lvm.devicePattern='/dev/nvme[0-9]n[0-9]'
```

For more details, see [csi-driver-lvm](https://github.com/metal-stack/csi-driver-lvm/blob/master/README.md)
