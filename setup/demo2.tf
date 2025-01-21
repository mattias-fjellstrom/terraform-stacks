resource "github_repository" "demo2" {
  name               = "terraform-stacks-demo-2"
  description        = "Demo repository for Terraform Stacks"
  gitignore_template = "Terraform"
  topics             = ["terraform", "aws"]
  visibility         = "private"

  has_wiki        = false
  has_discussions = false
  has_downloads   = false
  has_issues      = false
  has_projects    = false
}

locals {
  demo2_path       = "${path.module}/demo/demo-2"
  demo2_files      = fileset(local.demo2_path, "**/*.{tf,hcl,md,terraform-version}")
  demo2_file_paths = { for f in local.demo2_files : f => "${local.demo2_path}/${f}" }
}

resource "github_repository_file" "demo2_all" {
  for_each = local.demo2_file_paths

  repository = github_repository.demo2.name
  file       = each.key
  content    = file(each.value)
}

resource "github_repository_file" "demo2_locals" {
  repository = github_repository.demo2.name
  file       = "locals.tfdeploy.hcl"
  content    = <<-EOF
locals {
  role_arn = "${aws_iam_role.hcp_terraform_stacks.arn}"
}
EOF
}
