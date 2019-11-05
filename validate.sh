#!/usr/bin/env bash

# Getting region
EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"

# Get Synapse config file from SSM
aws ssm get-parameters --names /veoibd-aws-infra/synapseConfig --with-decryption --region ${EC2_REGION} --output text --query "Parameters[*].{Value:Value}" > /root/.synapseConfig

# Run the validation proceess
input_to_database.py --format_registry_packages veoibddatasubmission --config /config.json --onlyValidate main
