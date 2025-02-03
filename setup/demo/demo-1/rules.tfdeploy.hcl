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

orchestrate "auto_approve" "staging" {
  check {
    condition = context.plan.deployment == deployment.staging
    reason    = "Deployment is not 'staging'"
  }

  check {
    condition = context.operation == "plan"
    reason    = "Operation is not a plan"
  }

  check {
    condition = context.success
    reason    = "Plan operation was not successful"
  }

  check {
    condition = context.plan.component_changes["component.resource_group"].remove == 0
    reason    = "Resources would be deleted"
  }

  check {
    condition = context.plan.component_changes["component.storage_account"].remove == 0
    reason    = "Resources would be deleted"
  }
}