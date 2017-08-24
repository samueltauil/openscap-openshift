# openscap-openshift

In this demo we are using Host path, they are restricted by default in most SCCs since they provide direct access to the host. We need to grant access to an elevated SCC called `privileged`. Also use project `demo`.

1. Using `minishift` or `oc cluster up` login as `system:admin`:
```
oc login -u system:admin
```
  
2. Give grant access to `privileged` SCC:
```
oc adm policy add-scc-to-user privileged -z default -n demo
```

3. Create the secret (named `docker-registry`) to provide the credentials so the image inspector pod can pull and scan the image:
```
oc secrets new-dockercfg docker-registry \
    --docker-server=<registry-server-url> --docker-username=<username> \
    --docker-password=$(oc whoami -t) --docker-email=<email-address>
```

4. Provide the url for the image to scan (eg. `IMAGE_URL=registry.access.redhat.com/rhel7:latest`)
```
oc process -f image-inspector-template.json \
    -p APPLICATION_NAME=image-inspector -p IMAGE_URL=registry.access.redhat.com/rhel7:latest \
    | oc create -f -
```

or execute the script `create-objects.sh` to create everything you need.

5. In the case you executed the script, you are going to have Jenkins provisioned in the project, so log into Jenkins and go to Manage Plugins and install the Openshift Client Plugin.

6. Now you can go to Builds -> Pipeline, and start the pipeline.

7. Open the result report at `<route url>/api/v1/content/results.html`

8. The app provided by the inspector provides WebDAV sharing to the content of the image scanned, so on Mac you can execute:
```
cadaver http://<route url>/api/v1/content/
```
