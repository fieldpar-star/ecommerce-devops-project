#!/bin/bash

# Terraform destroy script

set -e

echo "WARNING: This will destroy all AWS resources!"
echo "=============================================="
echo ""

# Show what will be destroyed
echo "Resources to be destroyed:"
terraform plan -destroy
echo ""

# Confirm destruction
read -p "Are you sure you want to destroy all resources? Type 'yes' to confirm: " confirm
if [ "$confirm" != "yes" ]; then
    echo "Destruction cancelled"
    exit 0
fi

echo ""
read -p "This action cannot be undone. Type 'DESTROY' to proceed: " final_confirm
if [ "$final_confirm" != "DESTROY" ]; then
    echo "Destruction cancelled"
    exit 0
fi

# Destroy resources
echo ""
echo "Destroying infrastructure..."
terraform destroy -auto-approve
echo ""
echo "All resources destroyed successfully"