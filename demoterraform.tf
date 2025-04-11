resource "kubernetes_deployment" "test-deploy" {
  metadata {
    name = "demonginxterraform"
    labels = {
      test = "MyApp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "MyApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyApp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "demo-nginx-terraform"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "100Mi"
            }
            requests = {
              cpu    = "10m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
