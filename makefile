# Sample Makefile for Terraform

# Variables
TF = terraform

# Targets
init:
	$(TF) init

plan: init
	$(TF) plan -auto-approve

apply: plan
	$(TF) apply -auto-approve

# Clean target (optional)
clean:
	rm -rf .terraform

# PHONY targets to ensure these targets are always executed, even if files with the same names exist
.PHONY: init plan apply clean
