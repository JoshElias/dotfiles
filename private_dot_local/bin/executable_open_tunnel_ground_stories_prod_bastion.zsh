#!/usr/bin/env zsh

ssh -N -L 5431:ground-stories-production.cluster-clx0ponnomgu.us-west-2.rds.amazonaws.com:5432 ec2-user@bastion-prod
