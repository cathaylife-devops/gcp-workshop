### 取得 Token

1. 登入 Terraform Cloud 
2. User Settings > Tokens
4. 建立一個新 Token (一次性顯示，可以給一個識別名稱)
> https://www.terraform.io/cli/config/config-file

### 在未來工作環境中加入 .terraformrc (以Cloud Shello為例)

1. 登入 GCP，進入 Cloud Shell
2. 在目前當下的目錄直接新增 .terraformrc

    ```sh
    touch .terraformrc
    ```

3. 新增 .terraformrc 內容

    ```
    credentials "app.terraform.io" {
      token = "your.token.xxx.yyy.zzzzzzzzzzzzz"
    }
    ```

### Github

1. 新增 Repo, 注意 Repo 命名方式

    ```
    private module:
      terraform-gcp-xxx

    terraform project:
      gcp-xxx-yyy
    ```

2. 預設 .gitignore 可以選擇 `Terraform`

### Terraform Cloud Workspace 設定

1. 命名方式 workspace

    ```
    看情況而定，如果未來會將一個 Github Repo 分為 三個 workspace 那目前的命名方式為
    test-gcp-xxx-yyy (Github Repo: gcp-xxx-yyy)
    stag-gcp-xxx-yyy (Github Repo: gcp-xxx-yyy)
    prod-gcp-xxx-yyy (Github Repo: gcp-xxx-yyy)
    ```

2. 先選擇 cli 模式，後續可以再調整為 connect github 模式

3. 設定專案共用變數 Settings > Variable Sets > Workspaces 加入你新開的 workspace

### Dev...terraform

1. 回到 github 複製專案, 並在 Cloud Shell 將專案拉回

    ```
    git clone ...
    cd ...
    ```

2. 在專案中加入 `terraform-cloud-remote.tf`

    ```
    terraform {
      cloud {
        organization = "{Your_organization}"

        workspaces {
          name = "{Your_workspace}"
        }
      }
    }
    ```

3. 建立基本的 *.tf

    ```sh
    touch main.tf variables.tf providers.tf outputs.tf versions.tf
    ```

4. cli 開發，可在地端執行下列指令

    ```
    terraform init, plan, apply
    ```

5. 如果在 Terraform cloud 從 cli 切換為 VersionControl，開發區就不能使用 apply，因為已經切換為版本控制模式，push 後自行到 Terraform GUI 按下 plan 及 apply
    ```
    terraform init, plan
    ```

### Other: 善用 terraform cli

1. fmt 自動排版
2. validate 自動驗證
3. console 簡易排錯