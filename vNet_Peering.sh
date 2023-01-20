export RG = Azure_vNet_Peering

az group create --location eastus -n ${RG}

az network vnet create -g ${RG}-vNet-1 --address-prefix 10.26.0.0/16 --subnet-name ${RG}-Subnet-1 --subnet-prefix 10.26.1.0/24 -l eastus

az network vnet create -g ${RG}-vNet-2 --address-prefix 172.168.0.0/16 --subnet-name ${RG}-Subnet-1 --subnet-prefix 172.168.1.0/24 -l eastus

az network vnet create -g ${RG}-vNet-3 --address-prefix 192.168.0.0/16 --subnet-name ${RG}-Subnet-1 --subnet-prefix 192.168.1.0/24 -l westus