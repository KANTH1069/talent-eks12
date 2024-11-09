module "eks_aws-load-balancer-controller" {
  source  = "akw-devsecops/eks/aws//modules/aws-load-balancer-controller"
  version = "4.0.0"
  # insert the 1 required variable here
 oidc_provider_arn = module.eks.oidc_provider_arn
}
