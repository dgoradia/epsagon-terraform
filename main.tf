# data "template_file" "aws_iam_assume_role_policy" {
#   template_file = "${file("${path.module}/aws_iam_assume_role_policy.tpl")}"

#   vars {
#     epsagon_account_id  = "${var.epsagon_account_id}"
#     epsagon_external_id = "${var.epsagon_external_id}"
#   }
# }

# data "template_file" "aws_iam_role_policy" {
#   template = "${file("${path.module}/aws_iam_role_policy.tpl")}"
# }

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.epsagon_account_id}:root"]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["${var.epsagon_external_id}"]
    }
  }
}

data "aws_iam_policy_document" "role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "logs:PutSubscriptionFilter",
      "logs:DescribeSubscriptionFilters",
      "logs:DeleteSubscriptionFilter",
      "logs:FilterLogEvents",
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups",
      "lambda:List*",
      "lambda:Get*",
      "batch:Describe*",
      "xray:Get*",
      "xray:BatchGet*",
      "apigateway:GET",
      "apigateway:HEAD",
      "apigateway:OPTIONS",
      "states:List*",
      "states:Get*",
      "states:Describe*",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role" "role" {
  name               = "${var.aws_iam_role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

resource "aws_iam_role_policy" "role" {
  name   = "${var.aws_iam_role_name}"
  role   = "${aws_iam_role.role.id}"
  policy = "${data.aws_iam_policy_document.role_policy.json}"
}
