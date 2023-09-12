# <u> Openstack Scripting via Terraform </u>

## i. <u> Commands for running this script: </u>
<i> <b>Step 1:</b> Initializing the terraform </i>
```
$ terraform init
```

<i><b>Step 2:</b> Using plan command to see how these files are about to run, like and dry run or demo </i>
```
$ terraform plan -var-file "values.tfvars.json"
```

<i><b>Step 3:</b> Apply the files if everything seems error free </i>
```
$ terraform apply -var-file "values.tfvars.json"
```

<i><b>Step 4:</b> To destroy the applied plan </i>
```
$ terraform destroy -var-file "values.tfvars.json"
```

## ii. <u> Functions we are preforming via our Terraform Script </u>

### 1. Creating Host Aggregates: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 2. Creating Flavors: 
`The File : 02-flavor.tf containing the commands for creating the flavor`
### 3. Creating Images: 
`The File : 03-image.tf containing the commands for creating the image using a custom url`
### 4. Creating Network: 
`The File : 04-network.tf containing the commands for creating the network`
### 5. Creating Volumes: 
`The File : 05-volume.tf containing the commands for creating the volume`
### 6. Creating Security Group Rules for Ingress: 
`The File : 07-security-group-and-rules.tf containing the commands for creating the security group and adding rules to that group`
### 7. Creating Instances: 
`The File : 07-instance.tf containing the commands for creating the instance`

## iii. <u> Other important files </u>
### 1. variable.tf: 
`Containing all the variable defination`

### 2. values.tfvars.json: 
`Containing all the values of variables in json format`