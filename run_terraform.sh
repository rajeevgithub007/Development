#!/bin/bash

# Sample script to execute all targets in the Terraform Makefile

# Variables
TF=terraform

# Execute all targets
init() {
    init
    echo "Running 'init'..."
    $TF init
}

plan() {
    plan
    echo "Running 'plan'..."
    $TF plan -auto-approve
}

apply() {
    apply
    echo "Running 'apply'..."
    $TF apply -auto-approve
}

destroy() {
    destroy
    echo "Running 'destroy'..."
    $TF destroy -auto-approve
}

clean() {
    echo "Running 'clean'..."
    rm -rf .terraform
}

# Execute all targets
init
plan
apply
destroy
clean
