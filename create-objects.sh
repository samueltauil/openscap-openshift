#!/bin/bash

oc create -f is-welcome.json
oc create -f bc-welcome.json
oc create -f dc-welcome.json
oc create -f svc-welcome.json
oc create -f route-welcome.json
oc secrets new-dockercfg docker-registry --docker-server=docker-registry-default.apps.ocp.tauil.org --docker-username=admin --docker-password=$(oc whoami -t) --docker-email=test@test.com
oc create -f pipeline/pipeline-inspector.yml
oc create -f image-inspector-template.json
