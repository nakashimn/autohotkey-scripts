#HotIf WinActive("ahk_exe Code.exe")

;dbt
::bld::dbt build --select
::cmp::dbt compile --target dev --target-path target_dev
::run::dbt run-operation
::def::dbt build --select "state:modified" --defer --state target

;git
::gp::git pull
::gf::git fetch --prune
::gsu::git submodule update --remote

;aws
::aws::aws-mfa --profile

;terraform
::tfp::terraform plan
::tfa::terraform apply
::tfo::terraform output -json
::tfi::terraform init -var-file  -backend-config  -reconfigure
::tfe::tfenv install 1.8.4 && tfenv use 1.8.4

#HotIf
