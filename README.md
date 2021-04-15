# aws-eks-deploy-tool

Easily deploy your docker containers to EKS using this CI/CD deployment tool.
Actively used and tested with GitLab.

## Included software

### Kubernetes tools


|Tool |Version |URL
|--- | --- | ---
|kubectl |1.21.0 |https://kubernetes.io/docs/reference/kubectl/overview/
|Helm 3 |3.5.3 |https://github.com/kubernetes/helm
|Helm S3 plugin |0.10.0 |https://github.com/hypnoglow/helm-s3

### EKS tools

|Tool |Version |URL
|--- | --- | ---
|awscli |2 | https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
|aws-iam-authenticator |1.19.6/2021-01-05 | https://github.com/kubernetes-sigs/aws-iam-authenticator

### Utilities

|Tool |Version |URL
|--- | --- | ---
|envsubst |0.19.8.1 |https://www.gnu.org/software/gettext/manual/html_node/envsubst-Invocation.html
|Python |3.7.3 |https://www.python.org/
|yamllint |1.26.1 |https://github.com/adrienverge/yamllint
|yq (YAML parser) |2.12.0 |https://github.com/kislyuk/yq
|===

## Usage

