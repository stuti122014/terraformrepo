root_rg = {
  # rg1 = {
  #   resource_group_name = "dev-nitor-rg-001"
  #   location            = "westus"
  # }
  rg1 = {
    resource_group_name = "dev-nitor-rg-002"
    location            = "central india"
  }

}
root_storage = {
  storage1 = {
    storage_account_name     = "devnitorstorage001"
    resource_group           = "dev-nitor-rg-002"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
root_network = {
  network1 = {
    name                = "dev-nitor-vnet-001"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
    resource_group_name = "dev-nitor-rg-002"

    subnet = {
      subnet1 = {
        name             = "dev-nitor-subnet-001"
        address_prefixes = ["10.0.0.0/16"]
      }
    }
  }
}
root_server = {
  sqlserver1 = {
    name                = "dev-nitor-server-001"
    location            = "central india"
    resource_group_name = "dev-nitor-rg-002"
    admin_login         = "sqladmin"
    admin_password      = "@1234devnitor"

  }
}
root_AKS = {
  aks1 = {
    aks_name            = "dev-nitor-cluster-01"
    location            = "central india"
    resource_group_name = "dev-nitor-rg-002"
    dns_prefix          = "devnitoraks"
    default_node_pool   = "system"
    vm_size             = "standard_d2_v3"
    node_count          = "1"
    enviroment_name     = "Dev"

  }
}
root_database = {
  database1 = {
    database_name = "dev-nitor-db-001"
    sku_name      = "S0"
  }
}
root_userpool = {
  userpool1 = {
    userpoolname    = "devk8usrpl01"
    userpoolvm_size = "standard_d2_v3"
    usernodecount   = "1"
    enviroment_name = "dev"
  }
}
root_load_balancers = {
  lb1 = {
    name                = "dev-l4-lb-001"
    location            = "Central India"
    resource_group_name = "dev-nitor-rg-002"
  }
}
root_acrs = {
  acr1 = {
    name                = "devnitoracr001"
    location            = "Central India"
    resource_group_name = "dev-nitor-rg-002"
    sku                 = "Standard"
  }

}


