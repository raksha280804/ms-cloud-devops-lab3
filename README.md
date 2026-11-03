# Lab 3 — hello-app on Kubernetes with Terraform

Name:

Roll number:

## Part 1: first `terraform plan`

Paste the `Plan:` line and the summary above it.

```
Terraform will perform the following actions:

  # kubernetes_deployment_v1.hello will be created
  + resource "kubernetes_deployment_v1" "hello" {
      + id               = (known after apply)
      + wait_for_rollout = true

      + metadata {
          + generation       = (known after apply)
          + name             = "hello-app"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + min_ready_seconds         = 0
          + paused                    = false
          + progress_deadline_seconds = 600
          + replicas                  = "3"
          + revision_history_limit    = 10

          + selector {
              + match_labels = {
                  + "app" = "hello-app"
                }
            }

          + strategy (known after apply)

          + template {
              + metadata {
                  + generation       = (known after apply)
                  + labels           = {
                      + "app" = "hello-app"
                    }
                  + name             = (known after apply)
                  + resource_version = (known after apply)
                  + uid              = (known after apply)
                }
              + spec {
                  + automount_service_account_token  = true
                  + dns_policy                       = "ClusterFirst"
                  + enable_service_links             = true
                  + host_ipc                         = false
                  + host_network                     = false
                  + host_pid                         = false
                  + hostname                         = (known after apply)
                  + node_name                        = (known after apply)
                  + restart_policy                   = "Always"
                  + scheduler_name                   = (known after apply)
                  + service_account_name             = (known after apply)
                  + share_process_namespace          = false
                  + termination_grace_period_seconds = 30

                  + container {
                      + image                      = "shripada/hello-app:v1"
                      + image_pull_policy          = (known after apply)
                      + name                       = "hello-app"
                      + restart_policy             = (known after apply)
                      + stdin                      = false
                      + stdin_once                 = false
                      + termination_message_path   = "/dev/termination-log"
                      + termination_message_policy = (known after apply)
                      + tty                        = false

                      + port {
                          + container_port = 80
                          + protocol       = "TCP"
                        }

                      + resources (known after apply)
                    }

                  + image_pull_secrets (known after apply)

                  + readiness_gate (known after apply)
                }
            }
        }
    }

  # kubernetes_service_v1.hello will be created
  + resource "kubernetes_service_v1" "hello" {
      + id                     = (known after apply)
      + status                 = (known after apply)
      + wait_for_load_balancer = true

      + metadata {
          + generation       = (known after apply)
          + name             = "hello-app"
          + namespace        = "default"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }

      + spec {
          + allocate_load_balancer_node_ports = true
          + cluster_ip                        = (known after apply)
          + cluster_ips                       = (known after apply)
          + external_traffic_policy           = (known after apply)
          + health_check_node_port            = (known after apply)
          + internal_traffic_policy           = (known after apply)
          + ip_families                       = (known after apply)
          + ip_family_policy                  = (known after apply)
          + publish_not_ready_addresses       = false
          + selector                          = {
              + "app" = "hello-app"
            }
          + session_affinity                  = "None"
          + type                              = "LoadBalancer"

          + port {
              + node_port   = (known after apply)
              + port        = 8080
              + protocol    = "TCP"
              + target_port = "80"
            }

          + session_affinity_config (known after apply)
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```

## Part 1: `terraform output -raw url`

```
http://localhost:8080
```

## Part 2: plan for the v1 → v2 image change

Paste the lines that show the image change, and the `Plan:` line.

```
Terraform will perform the following actions:

  # kubernetes_deployment_v1.hello will be updated in-place
  ~ resource "kubernetes_deployment_v1" "hello" {
        id               = "default/hello-app"
        # (1 unchanged attribute hidden)

      ~ spec {
            # (5 unchanged attributes hidden)

          ~ template {
              ~ spec {
                    # (18 unchanged attributes hidden)

                  ~ container {
                      ~ image                      = "shripada/hello-app:v1" -> "shripada/hello-app:v2"
                        name                       = "hello-app"
                        # (10 unchanged attributes hidden)

                        # (2 unchanged blocks hidden)
                    }
                }

                # (1 unchanged block hidden)
            }

            # (2 unchanged blocks hidden)
        }

        # (1 unchanged block hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

## Part 3: plan that found the drift after `kubectl scale`

```

```

## Part 4: `kubectl get svc -A` showing dev and prod

```

```

## Break it: the error after deleting `terraform.tfstate`

```

```

## Break it: the wrong selector

What did you see, and how did you find the cause? One or two sentences.



## Screenshot

Save a browser screenshot as `screenshot.png` in the repository root.
