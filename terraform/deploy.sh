#!/bin/bash

# Terraform deployment script for E-commerce DevOps Project

set -e  # Exit on error

echo "E-commerce Infrastructure Deployment"
echo "========================================"
echo ""

# Check if AWS CLI is configured
if ! aws sts get-caller-identity &> /dev/null; then
    echo "Error: AWS CLI not configured."
    echo "Run: aws configure"
    exit 1
fi

echo "AWS CLI configured"
echo "Account: $(aws sts get-caller-identity --query Account --output text)"
echo "Region: $(aws configure get region)"
echo ""

# Check if terraform.tfvars exists
if [ ! -f "terraform.tfvars" ]; then
    echo " Error: terraform.tfvars not found"
    echo "Copy terraform.tfvars.example to terraform.tfvars and update values:"
    echo "  cp terraform.tfvars.example terraform.tfvars"
    exit 1
fi

echo "Configuration file found"
echo ""

# Initialize Terraform
echo "Initializing Terraform..."
terraform init
echo ""

# Validate configuration
echo "Validating Terraform configuration..."
terraform validate
echo ""

# Plan deployment
echo "Planning deployment..."
terraform plan -out=tfplan
echo ""

# Confirm deployment
read -p "Do you want to apply this plan? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "Deployment cancelled"
    exit 0
fi

# Apply deployment
echo "Deploying infrastructure..."
terraform apply tfplan
echo ""

# Show outputs
echo "Deployment complete!"
echo ""
echo "Outputs:"
terraform output
echo ""

# Get ALB URL
alb_url=$(terraform output -raw alb_url)
echo "Your application will be available at: $alb_url"
echo ""
echo "Note: It may take 5-10 minutes for the services to be fully healthy."
echo "   Run 'terraform output' to see all outputs again."
echo ""