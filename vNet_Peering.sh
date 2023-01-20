export RG=Azure_vNet_Peering

az group create --location eastus -n ${RG}

az network vnet create -g ${RG} -n ${RG}-vNet-1 --address-prefix 10.26.0.0/16 --subnet-name ${RG}-Subnet-1 --subnet-prefix 10.26.1.0/24 -l eastus

az network vnet create -g ${RG} -n ${RG}-vNet-2 --address-prefix 172.168.0.0/16 --subnet-name ${RG}-Subnet-1 --subnet-prefix 172.168.1.0/24 -l eastus

az network vnet create -g ${RG} -n ${RG}-vNet-3 --address-prefix 192.168.0.0/16 --subnet-name ${RG}-Subnet-1 --subnet-prefix 192.168.1.0/24 -l westus

az vm create -g ${RG} -n LVM-1 --image UbuntuLTS --vnet-name ${RG}-vNet-1 --subnet ${RG}-Subnet-1 --admin-username adminhsk --admin-password "Bharath@123456" --size Standard_B1s --nsg ""

az vm create -g ${RG} -n LVM-2 --image UbuntuLTS --vnet-name ${RG}-vNet-2 --subnet ${RG}-Subnet-1 --admin-username adminhsk --admin-password "Bharath@123456" --size Standard_B1s --nsg ""

az vm create -g ${RG} -n LVM-3 --image UbuntuLTS --vnet-name ${RG}-vNet-2 --subnet ${RG}-Subnet-1 --admin-username adminhsk --admin-password "Bharath@123456" --size Standard_B1s --nsg ""

az network vnet peering create --name vNet-1TOvNet-2 --vnet-name VN${RG}-vNet-1 --remote-vnet ${RG}-vNet-2 --resource-group ${RG} --allow-vnet-access --allow-forwarded-traffic

az network vnet peering create --name vNet-2TOvNet-1 --vnet-name VN${RG}-vNet-2 --remote-vnet ${RG}-vNet-1 --resource-group ${RG} --allow-vnet-access --allow-forwarded-traffic