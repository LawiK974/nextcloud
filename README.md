# nextcloud
my custom nextcloud image

Built image: `ghcr.io/lawik974/nextcloud` (tags `35.0.3-apache`, `latest`).
The workflow builds `linux/amd64` + `linux/arm64` (QEMU) for the Pi nodes.

Consume it in `k8s_apps/nextcloud/values.yaml` and drop the postStart hook:

```yaml
image:
  repository: ghcr.io/lawik974/nextcloud
  tag: 35.0.3-apache
# postStartCommand: remove it, packages are now baked in the image
```

