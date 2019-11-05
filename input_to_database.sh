#!/usr/bin/env bash

# Get Synapse config file from SSM
aws ssm get-parameters --names veoibd-aws-infra/synapseConfig --with-decryption --region us-east-1 --output text --query "Parameters[*].{Value:Value}" > /root/.synapseConfig

# Run the database update proceess
input_to_database.py main
