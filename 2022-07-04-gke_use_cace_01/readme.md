# GKE Use Case 01

Topics: GKE, Kubernetes, Jenkins, Git

Lab: [Set Up and Configure a Cloud Environment in Google Cloud: Challenge Lab](https://www.cloudskillsboost.google/focuses/10603?parent=catalog)

## Lab

### Task 1

```bash
docker build -t valkyrie-dev:v0.0.2 .
```

### Task 2

```bash
docker run --rm -it -p 8080:8080 valkyrie-dev:v0.0.2
```

### Task 3

```bash
docker tag valkyrie-dev:v0.0.2 gcr.io/[GCP Project ID]/valkyrie-dev:v0.0.2
```

```bash
docker push gcr.io/[GCP Project ID]/valkyrie-dev:v0.0.2
```

### Task 4

Command from cluster valkyrie-dev information page

```bash
gcloud container clusters get-credentials valkyrie-dev --zone [Cluster Zone] --project [GCP Project ID]
```

```bash
kubectl apply -f deployment.yaml
```

```bash
kubectl apply -f service.yaml
```

### Task 5

```bash
git merge origin/kurt-dev
```

```bash
docker build -t gcr.io/[GCP Project ID]/valkyrie-dev:v0.0.3 .
```

```bash
docker push gcr.io/[GCP Project ID]/valkyrie-dev:v0.0.3
```

### Task 6

```bash
printf $(kubectl get secret cd-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
```

```bash
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/component=jenkins-master" -l "app.kubernetes.io/instance=cd" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8080:8080 >> /dev/null &
```

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

```bash
git add source/html.go Jenkinsfile Dockerfile
git commit -m "update"
git push
```
