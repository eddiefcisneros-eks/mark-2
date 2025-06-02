locals {
  env               = "JCC2-staging"
  region            = "us-gov-west-1"
  zone1             = "us-gov-west-1a"
  zone2             = "us-gov-west-1b"
  eks_name          = "JCRS"
  eks_version       = "1.30"
  eks_node_name     = "JCC2-workers"
  istio_charts_url  = "https://istio-release.storage.googleapis.com/charts"
  istio-namespace   = "istio-system"
}
