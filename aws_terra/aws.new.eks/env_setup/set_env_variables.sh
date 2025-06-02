#!/bin/bash

# Set Environment Variables from the input.yaml
# 

set_env_variables() {

  # Convert input.yaml into env variables
  export $(yq  'to_entries | map(.key + "=" + .value) | join(" ")' input.yaml)

}