# Terraform AWS Modules

This repository contains various Terraform modules for AWS infrastructure. Explore the modules and find documentation for each one.

 # Must visit once : [Terraform AWS Examples by msrajawat298](https://github.com/msrajawat298/Terraform-aws-examples)

## Useful Links

- [Terraform AWS Modules Repository](https://github.com/terraform-aws-modules)
- [HashiCorp AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Learning Resources

### Video Tutorials

1. [Introduction to Terraform AWS Modules](https://www.youtube.com/watch?v=jv_LqNir4ak&list=PLiH9_MU-6RjLfyuiWRz_9MLoEYf18jwMx&index=6&ab_channel=Pythoholic)

2. [Terraform Tutorial by freeCodeCamp.org](https://www.youtube.com/watch?v=iRaai1IBlB0&pp=ygUWdGVycmFmb3JtIGZyZWVjb2RlY2FtcA%3D%3D&ab_channel=freeCodeCamp.org)

3. [Infrastructure as Code with Terraform - freeCodeCamp.org](https://www.youtube.com/watch?v=SLB_c_ayRMo&ab_channel=freeCodeCamp.org)

4. [Terraform AWS Tutorial by TechnicalGuftgu](https://www.youtube.com/watch?v=BequsOVM2aA&ab_channel=TechnicalGuftgu)

### Visual Studio Code Extension

- [Terraform SnippetMaster](https://marketplace.visualstudio.com/items?itemName=vitabletech.snippetmaster)

# Terraform Command Snippets

This repository provides Visual Studio Code snippets for common Terraform commands. These snippets can enhance your Terraform workflow by simplifying the usage of frequently used commands.

## Snippet List

- **Terraform Initialize**
  - Prefix: `_terraform_init`
  - Command: `terraform init`
  - Description: Initialize a Terraform working directory (downloads providers and modules).

- **Terraform Plan**
  - Prefix: `_terraform_plan`
  - Command: `terraform plan`
  - Description: Generate and show an execution plan for changes to be applied.

- **Terraform Apply**
  - Prefix: `_terraform_apply`
  - Command: `terraform apply`
  - Description: Apply changes to infrastructure according to a Terraform execution plan.

- **Terraform Destroy**
  - Prefix: `_terraform_destroy`
  - Command: `terraform destroy`
  - Description: Destroy Terraform-managed infrastructure.

- **Terraform Show**
  - Prefix: `_terraform_show`
  - Command: `terraform show`
  - Description: Show the current state or a saved plan.

- **Terraform Validate**
  - Prefix: `_terraform_validate`
  - Command: `terraform validate`
  - Description: Check whether the configuration files are valid.

- **Terraform Get Modules**
  - Prefix: `_terraform_get`
  - Command: `terraform get`
  - Description: Download and install modules for the configuration.

- **Terraform Console**
  - Prefix: `_terraform_console`
  - Command: `terraform console`
  - Description: Interactive console for evaluating expressions.

- **Terraform Import Resource**
  - Prefix: `_terraform_import`
  - Command: `terraform import resource_type.resource_name resource_id`
  - Description: Import existing infrastructure into Terraform.

- **Terraform Output**
  - Prefix: `_terraform_output`
  - Command: `terraform output`
  - Description: Show output values from your root module.

- **Terraform State**
  - Prefix: `_terraform_state`
  - Command: `terraform state [subcommand]`
  - Description: Advanced state management commands.

- **Terraform Version**
  - Prefix: `_terraform_version`
  - Command: `terraform version`
  - Description: Display the Terraform version installed on your system.

- **Terraform Version (JSON Format)**
  - Prefix: `_terraform_version_json`
  - Command: `terraform version -json`
  - Description: Display the Terraform version in JSON format.

- **Terraform Replace Command**
  - Prefix: `_terraform_replace`
  - Command: `terraform fmt -recursive`
  - Description: Format Terraform configuration files and replace existing files with the formatted version. Use with caution, as it overwrites the original files.

- **Terraform Apply with Auto-Approval**
  - Prefix: `_terraform_apply_auto_approve`
  - Command: `terraform apply -auto-approve`
  - Description: Apply changes to infrastructure without requiring interactive approval. Use with caution.

- **Terraform Validate**
  - Prefix: `_terraform_validate`
  - Command: `terraform validate`
  - Description: Check whether the configuration files are valid.

- **Terraform Output**
  - Prefix: `_terraform_output`
  - Command: `terraform output`
  - Description: Show output values from your root module.

- **Terraform Import**
  - Prefix: `_terraform_import`
  - Command: `terraform import resource_type.resource_name resource_id`
  - Description: Import existing infrastructure into Terraform.

- **Terraform Refresh**
  - Prefix: `_terraform_refresh`
  - Command: `terraform refresh`
  - Description: Update the state file to match the real-world resources. Useful when changes are made outside of Terraform.

if you need to apply the changes to an existing resource, you can use the -target option to specify which resource to apply the changes to. For example:

terraform apply -target=aws_instance.example_instance_myk

Feel free to contribute, raise issues, or explore the modules for your AWS infrastructure needs!
