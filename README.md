
# Azure ETL Project - ADF + Blob + SQL + Terraform + Notebook

## 1. Prerequisites
- Azure CLI
- Terraform installed
- Python with `pandas`, `pyodbc`, `azure-storage-blob`
- Jupyter installed

## 2. Deploy Infrastructure
```bash
cd terraform
terraform init
terraform apply
```

## 3. Upload Data and Query SQL
- Run the Jupyter notebook `upload_and_query.ipynb`

## 4. Clean Up
```bash
terraform destroy
```
