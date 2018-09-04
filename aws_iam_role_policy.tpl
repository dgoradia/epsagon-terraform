{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
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
                "states:Describe*"
            ],
            "Resource": "*",
            "Effect": "Allow",
            "Sid": "EpsagonPermissions"
        }
    ]
}