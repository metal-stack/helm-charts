# Helm Charts

Contains Helm Charts of metal-stack.

The charts can be consumed as follows:

1. Add the charts repository to your helm repository index.

   ```bash
   helm repo add metal-stack https://helm.metal-stack.io
   ```

1. Use the charts.

   ```bash
   helm install <chart-name> metal-stack/<chart-name>
   ```
