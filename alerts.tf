module "cost-billing-alarm" {
  source  = "binbashar/cost-billing-alarm/aws"
  version = "0.0.2"
  aws_env = "${var.aws_environment_tag}"
  aws_account_id = "${var.aws_account_id}"
  monthly_billing_threshold = 20
  currency = "${var.aws_currency}"
}

output "alert_sns_topic" {
    value = "${module.cost-billing-alarm.sns_topic_arn}"
}