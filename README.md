# grafana-dashboards
Ready-to-import Grafana dashboard JSON files for sysadmin monitoring.

## Dashboards
| Dashboard | Description |
|-----------|-------------|
| `dashboards/linux_overview.json` | Linux host overview: CPU, mem, disk, net |
| `dashboards/cloudera_cluster.json` | Cloudera services health overview |
| `dashboards/kubernetes_cluster.json` | Kubernetes cluster resource usage |
| `dashboards/security_events.json` | Security events from syslog |

## Import
1. Open Grafana → + → Import
2. Upload JSON file or paste content
3. Select your Prometheus datasource
