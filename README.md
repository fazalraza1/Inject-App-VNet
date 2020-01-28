# Inject-App-VNet
Inject App Service in a Virtual Network.

Introduction.
Lot of customer have requirement to run Azure App Service in a virtual network with private IP for inbound and outbound. There is no perfect solution at this time until we have Private Link enabled for App Service. 
This article is written for only multi-tenant App Service.
An Azure App Service can act as if it in a virtual network with a private IP for inbound and with an outbound that in the virtual network if you combine
1)	Service Endpoint + Application Gateway
2)	User Reginal VNet integration (preview)
Before you start deploying in your lab, read about the App Service VNet Integration and Networking features here and here.
Step by Step guide.
There are two parts to this configuration besides creating App Service and the Application Gateway. The first part is enabling service endpoints in the subnet of the virtual network where the Application Gateway is deployed. 
