resource "aws_iam_user" "user" {
name = var.iam_user
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.user.name
}



resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.user.name
  policy_arn = var.policy_arn
}
