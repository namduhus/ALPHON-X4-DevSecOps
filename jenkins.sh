docker run -d \
  --name jenkins \
  --network host \
  -u root \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /usr/local/bin/dockle:/usr/local/bin/dockle \
  -v /usr/local/bin/kubectl:/usr/local/bin/kubectl \
  -v /usr/local/bin/k3s:/usr/local/bin/k3s \
  -v /etc/rancher:/etc/rancher \
  -v /run/k3s:/run/k3s \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts