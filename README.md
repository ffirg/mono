# mono
Simple Mono/ASP.NET Docker build to be used for Red Hat Openshift Enterprise testing...

#### How To Build Inside OSE v3

*** REPLACE EVERYTHING IN QUOTES "" WITH YOUR OWN DETAILS

Login as a 'normal' everyday user
```
$ oc login -u "user-name"
```

Create a new project
```
$ oc new-project "project-name"
```

Create the app from git source code (it'll detect the Dockerfile and do the build/deploys)
```
$ oc new-app https://github.com/ffirg/mono.git
```

Allow users to access the app
```
$ oc expose service "service-name" --name="what-you-want-to-call-the-service" --hostname="FQDN-so-users-can-access"
```
Go to http://FQDN and you'll see the ASP.NET examples served up by the web server :)
