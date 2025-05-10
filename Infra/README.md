<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.94.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | ./modules/lambda | n/a |
| <a name="module_s3_buckets"></a> [s3\_buckets](#module\_s3\_buckets) | ./modules/s3 | n/a |
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | ./modules/sns | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | Name of the Lambda function | `string` | n/a | yes |
| <a name="input_original_bucket_name"></a> [original\_bucket\_name](#input\_original\_bucket\_name) | Name of the bucket for original images | `string` | n/a | yes |
| <a name="input_processed_bucket_name"></a> [processed\_bucket\_name](#input\_processed\_bucket\_name) | Name of the bucket for processed images | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_sns_topic_email"></a> [sns\_topic\_email](#input\_sns\_topic\_email) | Email address for SNS notifications | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | Name of the Lambda function |
| <a name="output_original_bucket_name"></a> [original\_bucket\_name](#output\_original\_bucket\_name) | Name of the bucket for original images |
| <a name="output_processed_bucket_name"></a> [processed\_bucket\_name](#output\_processed\_bucket\_name) | Name of the bucket for processed images |
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | ARN of the SNS topic |
<!-- END_TF_DOCS -->