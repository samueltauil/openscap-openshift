# openscap-openshift

1. Import the template

```
oc create -f image-inspector-template.json
```
 
2. Provide the url for the image to scan (eg. `IMAGE_URL=registry.access.redhat.com/rhel7:latest`)
```
oc process -f image-inspector-template.json \
    -p APPLICATION_NAME=image-inspector -p IMAGE_URL=registry.access.redhat.com/rhel7:latest \
    | oc create -f -
```
3. Open the result report at `<route url>/api/v1/content/results.html`

