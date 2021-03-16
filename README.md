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

## Contributing

If you want to add modifications to a chart, make sure to also bump your chart version in the chart's `Chart.yaml` file. This is necessary because a release of this repository does not overwrite existing chart releases (as this would potentially break already released deployments).

For PRs, your changes will be released to a special pull requests URL `helm.metal-stack.io/pull_requests/<branch-name>`. You can use this repository instead in order to test your changes.
