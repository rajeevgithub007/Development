#!/bin/bash

# Sample script to execute all targets in the Terraform Makefile

# Variables
TF=terraform

# Execute all targets
init() {
    echo "Running 'init'..."
    $TF init
}

plan() {
    init
    echo "Running 'plan'..."
    $TF plan -auto-approve
}

apply() {
    plan
    echo "Running 'apply'..."
    $TF apply -auto-approve
}

# destroy() {
#     apply
#     echo "Running 'destroy'..."
#     $TF destroy -auto-approve
# }


clean() {
    echo "Running 'clean'..."
    rm -rf .terraform
}

# Execute all targets
init
plan
apply
clean
