# openscap-openshift

In this demo we are using Host path, they are restricted by default in most SCCs since they provide direct access to the host. We need to grant access to an elevated SCC called `privileged`.

1. Using `minishift` or `oc cluster up` login as `system:admin`:
```
oc login -u system:admin
```
  
2. Give grant access to `privileged` SCC:
```
oc adm policy add-scc-to-user privileged <user name>
```
3. Create the secret (named `docker-registry`) to provide the credentials so the image inspector pod can pull and scan the image:
```
oc secrets new-dockercfg docker-registry \
    --docker-server=<registry-server-url> --docker-username=<username> \
    --docker-password=<password-or-token> --docker-email=<email-address>
```

4. Provide the url for the image to scan (eg. `IMAGE_URL=registry.access.redhat.com/rhel7:latest`)
```
oc process -f image-inspector-template.json \
    -p APPLICATION_NAME=image-inspector -p IMAGE_URL=registry.access.redhat.com/rhel7:latest \
    | oc create -f -
```
or execute the script `create-objects.sh` to create everything you need.

5. Open the result report at `<route url>/api/v1/content/results.html`

