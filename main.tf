
# Example Splunk Terraform Configuration
# Set correct Splunk instance credentials under the provider splunk resource block
# This basic example.tf creates a Splunk user and role, setup global HEC configuration,
# creates a new HEC token with indexer acknowledgement enabled
# creates a saved search to search for events received with above token as source
terraform {
  required_providers {
    splunk = {
      source  = "splunk/splunk"
    }
  }
}

provider "splunk" {
  url                  = "<enter_your_splunk_instance_url_here>"
  auth_token = "<enter_your_splunk_auth_token_here>"
  // Or use environment variables used:
  // SPLUNK_USERNAME
  // SPLUNK_PASSWORD
  // SPLUNK_URL
  // SPLUNK_INSECURE_SKIP_VERIFY (Defaults to true)
}
resource "splunk_saved_searches" "test-1" {
  actions                     = "email,slack"
  # action_email                = true
  action_email_format         = "table"
  action_email_max_time       = "5m"
  action_email_max_results    = "1"
  action_email_send_results   = true
  action_email_subject        = "Terraform test: $name$"
  action_email_to             = "aymankhan92@gmail.com,ayman-test@company.org.slack.com"
  action_email_include_search = 1
  action_slack_param_channel = "#ayman-test"
    action_slack_param_message = "Terraform test: $name$ \n yo this is test"
    action_slack_param_attachment = true
  alert_comparator            = "greater than"
  alert_expires               = "30d"
  alert_threshold             = "100"
  alert_type                  = "number of events"
  description                 = "no of errors in last 60 mins"
  cron_schedule               = "0 * * * *"
  alert_digest_mode           = true
  name                        = "ABMA-test"
  is_scheduled                = true
  alert_track                 = true
  dispatch_earliest_time      = "-60m"
  dispatch_latest_time        = "now"
  search                      = "index=*logs* app=test-service ERROR"

  acl {
    app     = "test-service"
    owner   = "aymankhan92"
    sharing = "app"
  }
}
