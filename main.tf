terraform {
  required_providers {
    hyperv = {
      source  = "taliesins/hyperv"
      version = "~> 1.0"
    }
  }
}

provider "hyperv" {
  host     = "CBM-IT-684.cbm.local"
  user     = "d"
  password = "tata"
}

resource "hyperv_machine_instance" "vm1" {
  name               = "test-vm"
  generation         = 2
  memory_startup     = 2048
  processor_count    = 2

  network_adaptors {
    switch_name = "Default Switch"
  }

  hard_disk_drives {
    path = "C:\\VirtualEnv\\VMachine\\testvm\\test-vm.vhdx"
    size = 50
  }
}
