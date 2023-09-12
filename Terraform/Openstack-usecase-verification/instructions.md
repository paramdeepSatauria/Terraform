# Openstack Scripting via Terraform 
## i. <i>Commands for running this script:</i>
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

Note: 

## ii. Functions we are preforming via our Terraform Script 

### 1. Creating Host Aggregates: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 2. Creating Flavors: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 3. Creating Images: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 4. Creating Network: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 5. Creating Volumes: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 6. Creating Instances: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 7. SSHing into an Instance: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 8. Creating Security Group Rules for Ingress: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 9. Attaching Volumes to Instances: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 10. Mounting Volumes to Instances and Adding Sample Data: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`
### 11. Detaching Volumes from One Instance and Attaching to other with Data Retention: 
`The File : 01-host-aggregator.tf containing the commands for creating the host aggregator`