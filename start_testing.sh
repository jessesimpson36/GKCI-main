#!/bin/bash
cp kernelci-ci-gkernelci.json.example GBuildbot-worker/.kernelci-ci-gkernelci.json
cp GBuildbot-master/buildbot-config.yaml.example GBuildbot-master/buildbot-config.yaml
cp ./GBuildbot-worker/labs.yaml.example ./GBuildbot-worker/labs.yaml
sed -i "s/your local docker GID/$(cat /etc/group | grep docker | cut -d: -f3)/" docker-compose.yml.template
python sparser.py || exit $?
docker compose up -d
