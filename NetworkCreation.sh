# Virtual Network Creation

az network vnet create \
  --name AppGWVNet \
  --resource-group AppServNetInteg \
  --location eastus \
  --address-prefix 10.6.0.0/16 \
  --subnet-name AppGWvsub \
  --subnet-prefix 10.6.0.0/24

# Virtual Network Creation

  az network vnet create \
  --name AppvNet \
  --resource-group AppServNetInteg \
  --location eastus \
  --address-prefix 10.5.0.0/16 \
  --subnet-name AppSub \
  --subnet-prefix 10.5.0.0/24

# Virtual Network Peering 

  az network vnet peering create --resource-group AppServNetInteg \
  --name AppGWvNetTOAppvNet \
   --vnet-name AppGWVNet \
    --remote-vnet AppvNet --allow-vnet-access

  az network vnet peering create --resource-group AppServNetInteg \
  --name AppvNetToAppGWvNet \
   --vnet-name AppvNet \
    --remote-vnet AppGWVNet --allow-vnet-access

#Public IP Creation for AppGateway

az network public-ip create \
  --resource-group AppServNetInteg \
  --name MyAppGWPubIP \
  --allocation-method Static \
  --sku Standard

# Application Gateway Creation.
az network application-gateway create --resource-group AppServNetInteg --name MyAppGateway \
--capacity 2 --sku Standard_v2 \
    --vnet-name AppGWVNet --subnet AppGWvsub \
	--http-settings-cookie-based-affinity Enabled \
    --public-ip-address MyAppGWPubIP \
    --private-ip-address 10.6.0.100





