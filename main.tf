resource "google_compute_disk_iam_member" "compute_disk_iam_members" {
  for_each = var.compute_disk_iam_members

  member  = each.value.member
  name    = each.value.name
  role    = each.value.role
  project = each.value.project
  zone    = each.value.zone

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

