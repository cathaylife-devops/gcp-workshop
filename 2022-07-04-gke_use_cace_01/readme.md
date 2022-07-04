# GKE Use Case 01

Topics: GKE, Kubernetes, Jenkins, Git

Lab: [Deploy to Kubernetes in Google Cloud: Challenge Lab](https://www.cloudskillsboost.google/focuses/10457?parent=catalog)

## Lab

### Task 1

```bash
docker build -t valkyrie-dev:[tag] .
```

### Task 2

```bash
docker run --rm -it -p 8080:8080 valkyrie-dev:[tag]
```

### Task 3

```bash
docker tag valkyrie-dev:[tag] gcr.io/[GCP Project ID]/valkyrie-dev:[tag]
```

```bash
docker push gcr.io/[GCP Project ID]/valkyrie-dev:[tag]
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
docker build -t gcr.io/[GCP Project ID]/valkyrie-dev:[new version tag] .
```

```bash
docker push gcr.io/[GCP Project ID]/valkyrie-dev:[new version tag]
```

### Task 6

取得 jenkins admin 密碼

```bash
printf $(kubectl get secret cd-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
```

在 Cloud Shell 使用 port-forward expose Jenkins 頁面，使用 admin 帳號登入

```bash
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/component=jenkins-master" -l "app.kubernetes.io/instance=cd" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8080:8080 >> /dev/null &
```

修改 Jenkinsfile 第 68 行，可以參考 [Jenkinsfile](./Jenkinsfile)

第 68 行

```groovy
sh("sed -i.bak 's#gcr.io/${PROJECT}/valkyrie-app:v0.0.1#${IMAGE_TAG}#' ./k8s/deployment.yaml")
```

更改為

```groovy
sh("sed -i.bak 's#IMAGE_HERE#${IMAGE_TAG}#' ./k8s/deployment.yaml")
```

設定 git

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

add、commit、push，不更新 k8s/deployment.yaml

```bash
git add source/html.go Jenkinsfile Dockerfile
git commit -m "update"
git push
```
