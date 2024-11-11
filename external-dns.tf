module "eks-external-dns" {
  source  = "lablabs/eks-external-dns/aws"
  version = "1.2.0"
  # insert the 2 required variables here
  cluster_identity_oidc_issuer     = module.eks.cluster_oidc_issuer_url
  cluster_identity_oidc_issuer_arn = module.eks.oidc_provider_arn
}
