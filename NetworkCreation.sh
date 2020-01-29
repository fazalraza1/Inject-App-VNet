az network vnet create \
  --name AppGWVNet \
  --resource-group AppServNetInteg \
  --location eastus \
  --address-prefix 10.6.0.0/16 \
  --subnet-name AppGWvsub \
  --subnet-prefix 10.6.0.0/24



  az network vnet create \
  --name AppvNet \
  --resource-group AppServNetInteg \
  --location eastus \
  --address-prefix 10.5.0.0/16 \
  --subnet-name AppSub \
  --subnet-prefix 10.5.0.0/24


az network public-ip create \
  --resource-group AppServNetInteg \
  --name MyAppGWPubIP \
  --allocation-method Static \
  --sku Standard

az network application-gateway create --resource-group AppServNetInteg --name MyAppGateway \
--capacity 2 --sku Standard_v2 \
    --vnet-name AppGWVNet --subnet AppGWvsub \
	--http-settings-cookie-based-affinity Enabled \
    --public-ip-address MyAppGWPubIP \
    --private-ip-address 10.6.0.100
    