#!/bin/bash

oc create -f is-welcome.json
oc create -f bc-welcome.json
oc create -f dc-welcome.json
oc create -f svc-welcome.json
oc create -f route-welcome.json
oc create -f pipeline/pipeline-inspector.yml
oc create -f image-inspector-template.json
