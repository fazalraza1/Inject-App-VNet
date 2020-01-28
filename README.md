Inject App Service in a Virtual Network.

## Introduction.
Lot of customer have requirement to run Azure App Service in a virtual network with private IP for inbound and outbound. There is no perfect solution at this time until we have Private Link enabled for App Service. 
This article is written for only multi-tenant App Service.
An Azure App Service can act as if it in a virtual network with a private IP for inbound and with an outbound that in the virtual network if you combine
1)	Service Endpoint + Application Gateway
2)	User Reginal VNet integration (preview)
Before you start deploying in your lab, read about the App Service VNet Integration and Networking features here and here.
## Step by Step guide.
There are two parts to this configuration besides creating App Service and the Application Gateway. The first part is enabling service endpoints in the subnet of the virtual network where the Application Gateway is deployed. Service endpoint will ensure all network traffic leaving the subnet towards the App Service will be tagged with the specific subnet ID. The Second part is to set the access restriction of the specific web app to ensure that only traffic tagged with this specific subnet ID is allowed. 
Prerequisites
1)	Two Virtual Network, and a subnet in each Virtual Network, one Virtual Network subnet will be suing for Application Gateway and Second Virtual Network Subnet is for App Service vNet Integration. 
2)	Two Virtual Network’s is not a requirement, this lab can be setup using one Virtual Network.
3)	Peering between two Virtual Networks.
4)	Azure Cloud Shell. 
5)	Visual Studio 2019
We will create app service using Azure Cloud Shell and Deploy Sample app using Visual Studio 2019.
### Create a resource Group
az group create --location eastus --name AppServNetInteg 
### Create a app service plan
az appservice plan create --name mywebapp --resource-group AppServNetInteg --sku S1 

### Create a web app.
az webapp create -–name mywebapp –-resource-group AppServNetInteg –-plan mywebapp
At this time webapp is created with app service plan sku S1.
### Deploy a sample app using Visual Studio 2019. 
Create an ASP.NET Core web app
Create an ASP.NET Core web app by following these steps:
1.	Open Visual Studio and then select Create a new project.
2.	In Create a new project, find and choose ASP.NET Core Web Application for C#, then select Next.
3.	In Configure your new project, name the application myFirstAzureWebApp, and then select Create.
 
![alt text](/VS1.png "New Project")







