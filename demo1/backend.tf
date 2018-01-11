terraform {
    backend "s3" {
        bucket = "terraform-state-321"
        key = "terraform/demo4"
    }
}