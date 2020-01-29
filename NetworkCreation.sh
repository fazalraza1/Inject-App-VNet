az network vnet create \
  --name AppGW \
  --resource-group myResourceGroupAG \
  --location eastus \
  --address-prefix 10.6.0.0/16 \
  --subnet-name AppGWvsub \
  --subnet-prefix 10.6.0.0/24



  az network vnet create \
  --name myVNet \
  --resource-group myResourceGroupAG \
  --location eastus \
  --address-prefix 10.5.0.0/16 \
  --subnet-name myAGSubnet \
  --subnet-prefix 10.5.0.0/24


az network public-ip create \
  --resource-group myResourceGroupAG \
  --name MyAppGWPubIP \
  --allocation-method Static \
  --sku Standard