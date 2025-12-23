#!/usr/bin/env zsh

ssh -N -L 3307:ground-production.cluster-clx0ponnomgu.us-west-2.rds.amazonaws.com:3306 ec2-user@bastion-prod
