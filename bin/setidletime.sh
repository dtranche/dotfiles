#!/bin/bash
minutes=$(expr 60 \* $1)
sudo sh -c "echo "$minutes" > /etc/idle_terminate_threshold"