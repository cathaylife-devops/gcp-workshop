# GKE Use Case 02

Topics: GKE, Kubernetes, VPC, Cloud SQL, Monitoring, IAM

Lab: [Set Up and Configure a Cloud Environment in Google Cloud: Challenge Lab](https://www.cloudskillsboost.google/focuses/10603?parent=catalog)

## Lab

### Task 1 & Task 2

1. [無類別區隔路由CIDR技術 依需求善用有限IP位址](https://www.netadmin.com.tw/netadmin/zh-tw/technology/0B9B631F987A45439061B6629F63DD07)
2. [IPv4 / IPv6 CIDR計算器](https://zh-tw.rakko.tools/tools/27/)

### Task 4

```bash
gcloud sql connect griffin-dev-db --user=root
```

### Task 6

下載 gs://cloud-training/gsp321/wp-k8s 上的檔案，內容可參考 [wp-k8s](./wp-k8s)

```bash
gsutil cp -r gs://cloud-training/gsp321/wp-k8s .
```

```bash
kubectl apply -f wp-env.yaml
```

### Task 7

```bash
kubectl apply -f wp-deployment.yaml
kubectl apply -f wp-service.yaml
```
