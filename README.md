# Terraform Splunk Alerts Demo

This repository provides a demo Terraform configuration for creating Splunk alerts. It serves as a reference for users who want to set up their own Terraform-based Splunk alerts.

## Features

- **Provider Configuration**: Demonstrates how to configure the Splunk provider with authentication details.
- **Saved Searches**: Includes an example of creating a Splunk saved search with email and Slack actions.
- **Customizable Alerts**: Allows users to define alert thresholds, schedules, and search queries.
- **Access Control**: Shows how to configure ACLs for Splunk resources.

## Prerequisites

- **Terraform**: Ensure Terraform is installed on your system. Refer to the [Terraform installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
- **Splunk Instance**: A running Splunk instance with API access enabled.
- **Splunk Provider Plugin**: The `splunk/splunk` provider must be available in your Terraform setup.

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/terraform-splunk-alerts-demo.git
   cd terraform-splunk-alerts-demo
   ```

2. Update the `provider` block in `main.tf` with your Splunk instance details:
   ```hcl
   provider "splunk" {
     url        = "<your_splunk_instance_url>"
     auth_token = "<your_splunk_auth_token>"
   }
   ```

3. Customize the `splunk_saved_searches` resource in `main.tf` to suit your alerting requirements:
   - Modify the `search` query.
   - Adjust the `cron_schedule` for the desired frequency.
   - Update the `action_email_to` and `action_slack_param_channel` fields.

4. Initialize Terraform:
   ```bash
   terraform init
   ```

5. Plan and apply the configuration:
   ```bash
   terraform plan
   terraform apply
   ```

6. Verify the created alert in your Splunk instance.

## Example Configuration

The repository includes an example configuration in `main.tf` that creates a Splunk saved search with the following properties:
- Alerts for errors in the last 60 minutes.
- Sends notifications via email and Slack.
- Runs every hour.

## Notes

- Replace placeholder values (e.g., `<your_splunk_instance_url>`, `<your_splunk_auth_token>`) with actual values.
- Test the configuration in a non-production environment before deploying to production.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
