/*
module "eks_aws-load-balancer-controller" {
  source  = "akw-devsecops/eks/aws//modules/aws-load-balancer-controller"
  version = "4.0.0"
  # insert the 1 required variable here
 oidc_provider_arn = module.eks.oidc_provider_arn
}

*/

module "load_balancer_controller" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-lb-controller.git"

  cluster_identity_oidc_issuer     = module.eks.cluster_oidc_issuer_url
  cluster_identity_oidc_issuer_arn = module.eks.oidc_provider_arn
  cluster_name                     = local.cluster_name
}
