# Site-to-Site VPN Between GCP & AWS

This is a demo of how to deploy a Site-to-Site VPN between GCP and AWS.

## Setup

Before running the demo, ensure that you have the following installed and configured:

    - Terraform installed [Download Terraform](https://www.terraform.io/downloads.html)
    - AWS CLI Installed [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv1.html)
    - Google Cloud CLI Installed [Installing Google Cloud SDK](https://cloud.google.com/sdk/install)

> **IMPORTANT** It's best practice to try this out on a **non-production workload first** to ensure you understand how the resources will interact with your setup. Also note that deploying this configuration **will incur costs** on both the AWS & GCP side.


## Step 1 - Ensure that the AWS & GCP CLIs are configured

Ensure that both the AWS & GCP CLI tools are configured.

```bash
# Google Cloud CLI is configured?
$ gcloud config configurations list
NAME     IS_ACTIVE  ACCOUNT                   PROJECT    COMPUTE_DEFAULT_ZONE  COMPUTE_DEFAULT_REGION
default  True       <your-email-address>      <project>  europe-west2-c        europe-west2

# AWS CLI is configured?
$ aws sts get-caller-identity
{
    "UserId": "AIDAU4KESKG7JHGUIEZBW",
    "Account": "<account-id>",
    "Arn": "arn:aws:iam::<account-id>:user/<username>"
}
```

## Step 2 - Configure Terraform Input Variables

Open the `vpn/inputs.auto.tfvars` file and update the values to for the GCP and AWS VPCs.

```t
#
# GCP Variables
#
gcp_credentials_file_path = "/home/ubuntu/.config/gcloud/legacy_credentials/<your-email@domain.com>/adc.json"

gcp_project_id = "<project_id>"

gcp_region = "europe-west2"

gcp_network_name = "default"

#
# AWS Variables
#
aws_credentials_file_path = "/home/ubuntu/.aws/credentials"

aws_region = "eu-west-1"

aws_vpc_id = "<vpc_id>"
```

## Step 3 - Initialize Terraform and Inspect the Plan

With the variables configured, we can initialize Terraform and generate a plan:

```bash
$ cd vpn

# Initialize Terraform Providers
$ terraform init

# Generate the Plan
$ terraform plan -var-file inputs.tfvars -out vpn-connection.tfplan

# View the Plan
$ terraform show vpn-connection.tfplan
```

> **IMPORTANT** Check the output of the plan to make sure it won't interfere with your existing setup.

## Step 4 - Apply the Terraform Plan

Once you're ready to deploy this configuration you can apply:

```bash
$ cd vpn

$ terraform apply vpn-connection.tfplan
```

## [Optional] Step 5 - Tear Down & Cleanup

If you're just testing this in a non-production environment, you can save costs by deleting the resources when you're finished.

```bash
$ cd vpn

$ terraform destroy
```
