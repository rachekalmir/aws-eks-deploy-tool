FROM debian:stable

RUN apt-get update \
    # Install envsubst and dependencies
    && apt-get install -y apt-transport-https gnupg curl git unzip python3=3.7.3-1 python3-pip gettext-base \

    # Install KubeCTL
    && curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update && apt-get install -y kubectl=1.21.0-00 \

    # Install Helm
    && curl https://baltocdn.com/helm/signing.asc | apt-key add - \
    && echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && apt-get update && apt-get install -y helm=3.5.3-1 \

    # Install Helm S3
    && helm plugin install https://github.com/hypnoglow/helm-s3.git --version 0.10.0 \

    # Install AWS CLI
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip ./aws \

    # Install AWS iam-authenticator
    # https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
    && curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator \
    && curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator.sha256 \
    && openssl sha1 -sha256 aws-iam-authenticator \
    && chmod +x ./aws-iam-authenticator \
    && mv aws-iam-authenticator /usr/local/bin/aws-iam-authenticator \
    # Test iam-authenticator
    && aws-iam-authenticator help \

    # Install YAML tools - yamllink and yq
    && pip3 install yamllint==1.26.1 yq==2.12.0

CMD bash
