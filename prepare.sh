export MY_CICD_REGISTRATION_TOKEN=GR1348941ckL4FBBSQTWxAD_3WrgU
echo '🦊===> Your runner token is : '
echo $MY_CICD_REGISTRATION_TOKEN
echo '🦊===>  Installation GitLab Runner'
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
      
      sudo chmod +x /usr/local/bin/gitlab-runner

      sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

      sudo usermod -aG gitpod gitlab-runner

      sudo chmod 666 /var/run/docker.sock

      sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner

      sudo gitlab-runner start
      sudo gitlab-runner  register \
        --non-interactive \
        --executor "shell" \
        --docker-image ruby:2.7 \
        --url "https://gitlab.com/" \
        --registration-token $MY_CICD_REGISTRATION_TOKEN \
        --description "gitpod-runner" \
        --tag-list "build-runner-tekab" \
        --access-level="not_protected"

