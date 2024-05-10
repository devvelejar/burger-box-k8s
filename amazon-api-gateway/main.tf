provider "aws" {
  region = "us-east-1"
}


resource "aws_lambda_function" "minha_funcao_lambda" {
  filename      = "apigateway.zip"
  function_name = "minha_funcao_lambda"
  role          = var.labRole
  handler       = "index.handler"
  runtime       = "nodejs20.x"
}

resource "aws_api_gateway_rest_api" "meu_api_gateway" {
  name        = "meu_api_gateway"
  description = "API Gateway para autenticação via Cognito"
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.meu_api_gateway.id

  depends_on = [aws_api_gateway_integration.integration]
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id = aws_api_gateway_rest_api.meu_api_gateway.id
  stage_name = "prod"
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.meu_api_gateway.id
  parent_id   = aws_api_gateway_rest_api.meu_api_gateway.root_resource_id
  path_part   = "auth"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.meu_api_gateway.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.meu_api_gateway.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.minha_funcao_lambda.invoke_arn
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.minha_funcao_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:us-east-1:467827799632:${aws_api_gateway_rest_api.meu_api_gateway.id}/*/*/*"
}
