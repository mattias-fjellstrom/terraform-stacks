orchestrate "auto_approve" "development" {
  check {
    condition = context.plan.deployment == deployment.development
    reason    = "Deployment is not 'development'"
  }

  check {
    condition = context.operation == "plan"
    reason    = "Operation is not a plan"
  }

  check {
    condition = context.success
    reason    = "Plan operation was not successful"
  }
}