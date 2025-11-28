resource_groups = {
  rg1 = {
    location = "West Europe"
    resource_group_name = "rg-todo"
    tags = {
      env  = "prod"
      team = "app"
    }
  }
}

vnet_details = {
  vnet1 = {
    name                = "vnet-todo"
    location            = "East US"
    resource_group_name = "rg-todo"
    address_space       = ["10.0.0.0/16"]

    subnets = {
      frontend = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      backend = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

storage_accounts = {
sa1={
  name                     = "storageacc2359"
  resource_group_name      = "rg-todo"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
}

network_interfaces = {
  nic1 = {
    name                = "nic-frontend"
    location            = "East US"
    resource_group_name = "rg-todo"
    subnet_name         = "frontend-subnet"
    private_ip_allocation = "Dynamic"
  }

  nic2 = {
    name                = "nic-backend"
    location            = "East US"
    resource_group_name = "rg-todo"
    subnet_name         = "backend-subnet"
    private_ip_allocation = "Dynamic"
  }
}
