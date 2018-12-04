"""An example of constructing a profile with a single Xen VM from CloudLab.

Instructions:
Wait for the profile instance to start, and then log in to the VM via the
ssh port specified below.  (Note that in this case, you will need to access
the VM through a high port on the physical host, since we have not requested
a public IP address for the VM itself.)
"""
import geni.portal as portal
import geni.rspec.pg as RSpec
import geni.rspec.igext as IG
# Emulab specific extensions.
import geni.rspec.emulab as emulab
from lxml import etree as ET
import crypt
import random
import os.path
import sys

node.addService(RSpec.Execute("sh", "sudo bash /local/repository/setup_scripts/general.sh"))
# Create a Request object to start building the RSpec.
request = portal.context.makeRequestRSpec()
# Create a XenVM
node = request.XenVM("node")
node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU18-64-STD"
node.routable_control_ip = "true"
disableTestbedRootKeys = True

rspec = RSpec.Request()
node.addService(RSpec.Execute("sh", "sudo bash /local/repository/setup_scripts/general.sh"))
node.addService(RSpec.Execute(shell="/bin/sh",
                              command="sudo apt update"))
node.addService(RSpec.Execute(shell="/bin/sh",
                              command="sudo apt install -y apache2"))
node.addService(RSpec.Execute(shell="/bin/sh",
                              command='sudo su allow in "Apache Full"'))
node.addService(RSpec.Execute(shell="/bin/sh",
                              command='sudo systemctl status apache2'))
node.addService(RSpec.Execute("sh", "sudo bash /local/repository/setup_scripts/general.sh"))
rspec.addResource(node)
# Print the RSpec to the enclosing page.
portal.context.printRequestRSpec()
