orchestrate "auto_approve" "good_plan" {
  check {
    condition = context.operation == "plan"
    reason    = "Operation is not a plan"
  }

  check {
    condition = context.success
    reason    = "Plan operation was not successful"
  }
}
