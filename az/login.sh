#!/bin/bash
#
az login --service-principal -u $AZ_SERVICE_PRINCIPAL -p $AZ_CLIENT_SECRET --tenant $AZ_TENANT
