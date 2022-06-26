# Cloud SQL

## Lab

[Cloud SQL for PostgreSQL: Qwik Start](https://www.cloudskillsboost.google/focuses/937?parent=catalog)

## Command

### Connect Cloud SQL from VM 

1. Install PostgreSQL client

    ```bash
    sudo apt-get install -y postgresql-client
    ```

2. Connect PostgreSQL DB

    ```bash
    psql "sslmode=disable dbname=postgres user=postgres hostaddr=PUBLIC_IP"
    ```

## Reference

1. [The Cloud Girl: GCP sketch notes](https://thecloudgirl.dev/sketchnote.html)
2. [GCP Documentation: Cloud SQL Auth proxy](https://cloud.google.com/sql/docs/postgres/sql-proxy)
3. [cloudsql-proxy GitHub repository](https://github.com/GoogleCloudPlatform/cloudsql-proxy)
4. [Cloud SQL with private IP only: the Good, the Bad and the Ugly](https://medium.com/google-cloud/cloud-sql-with-private-ip-only-the-good-the-bad-and-the-ugly-de4ac23ce98a)
