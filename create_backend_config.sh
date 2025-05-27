# /bin/bash


cat > backend.tfbackend <<EOF
resource_group_name  = "${TF_VARS_rg_name}"
storage_account_name = "${TF_VARS_blobstorage}"
container_name       = "${TF_VARS_blobcontainer}"
key                  = "terraform.tfstate"
EOF

terraform init -backend-config="backend.tfbackend"
ls -la
