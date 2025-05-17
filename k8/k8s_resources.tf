#k8_resources.tf
resource "kubernetes_namespace" "todo" {
  metadata {
    name = "todo"
  }
}

resource "kubernetes_deployment" "todo_api" {
  metadata {
    name      = "todo-api"
    namespace = kubernetes_namespace.todo.metadata[0].name
    labels = {
      app = "todo-api"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "todo-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "todo-api"
        }
      }

      spec {
        container {
          name  = "todo-api"
          image = "solomon11/todo-api:latest"  # <-- your Docker Hub image

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "todo_service" {
  metadata {
    name      = "todo-service"
    namespace = kubernetes_namespace.todo.metadata[0].name
  }

  spec {
    selector = {
      app = "todo-api"
    }

    port {
      port        = 3000
      target_port = 3000
    }

    type = "NodePort"
  }
}
