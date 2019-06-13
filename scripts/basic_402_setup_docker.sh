#!/bin/bash

usermod -a -G docker imafish
cp ../data/daemon.json /etc/docker/
