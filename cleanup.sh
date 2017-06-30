#!/bin/bash

oc project demo
oc delete all --all
oc delete template image-inspector-template
oc delete secret docker-registry
