# Project-1
## Elk-Stack Project

### Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

- https://github.com/krystalhdz6/Project-1/blob/main/Images/diagram.PNG

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

- https://github.com/krystalhdz6/Project-1/blob/main/Ansible/filebeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

- Load balancers protect the availability aspect of security.

- The advantage of a jump box is that it is a secure admin workstation (SAW) that all admins will need to connect to the jump box in order to perform any administrative task. 

Without a jump box, admins would be performing high-risk tasks (like opening emails that could contain malware) and then perform administrative tasks with administrative credentials on compromised networks. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

- Filebeat monitors the log files or locations specified and collects log events.

- Metricbeat periodically collects metrics and statistics and ships them to the output specified.




The configuration details of each machine may be found below

| Name       | Function        | IP Address | Operating System |
|------------|-----------------|------------|------------------|
| Jump Box   | Server          | 10.0.0.6   | Linux            |
| Web-1      | Server          | 10.0.0.4   | Linux            |
| Web-2      | Server          | 10.0.0.5   | Linux            |
| Web-3      | Server          | 10.0.0.7   | Linux            |
| ELK-VM     | Elk Server      | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
o	Public IP: $home_IP

Machines within the network can only be accessed by SSH.

•	The only machine that can access the Elk-Server is via SSH from the Ansible container on the Jump-Box¬ — using its Private IP. 

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses       |
|------------|---------------------|----------------------------|
| Jump-Box   | No                  | Personal IP- $home_IP      |
| Web-1      | No                  | 10.0.0.6                   |
| Web-2      | No                  | 10.0.0.6                   |
| Web-3      | No                  | 10.0.0.6                   |
| Elk-Server | No                  | 10.0.0.6 & $home_IP        |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because you are able to configure multiple machines through the use of a single command after initial configuration.

The playbook implements the following tasks:

-	Set the vm.max_map_count to 262144 to increase memory usage.
-	Install the docker.io and python3-pip apt packages. 
-	Install the docker pip package.
-	Download and configure the Docker container to start with the following port mappings: [5601:5601,9200:9200,5044:5044]. 
-	Start the container and enable the docker service on boot. 
-	Launch the elk-docker container to start the ELK server. Confirm the container is up by connecting to the ELK server via SSH and running the command [ sudo docker ps ].

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
-	https://github.com/krystalhdz6/Project-1/blob/main/Images/docker-ps-output.png

### Target Machines & Beats

This ELK server is configured to monitor the following machines:

- Web-1 10.0.0.4
- Web-2 10.0.0.5
- Web-3 10.0.0.7

We have installed the following Beats on these machines:
-	Filebeat and Metricbeat.

These Beats allow us to collect the following information from each machine:
-	Filebeat monitors log files/locations that are specified, collects log events and forwards them to either Logstash or Elasticsearch for indexing.
-	Metricbeat collects metrics from the operating system and services running on the server. It then takes the metrics and statistics that it collects and ships them to the output that is specified.

 ### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
-	Copy the filebeat.yml and metricbeat.yml file to the /etc/ansible/roles/files directory.
-	Update the configuration file to include to include the Private IP of the Elk-Server to the Elasticsearch and Kibana sections.
-	Run the playbook, and navigate to the Elk-Server to check that the installation worked as expected.
-	The playbook is named filebeat-playbook.yml. You copy the file to the /etc/ansible/roles/ directory.
-	You need to update the filebeat.yml. Assuming you’ve already added the new [elk] server group to the host file, add the Private IP of the Elk-Server to lines 1106 and 1806 in the filebook.yml file. This will specify which machine to install the ELK server on versus which to install Filebeat on. 
-	Navigate to http://[Elk-Server_PublicIP]:5601 to check that the ELK server is up and running.

These are the specific commands the user will need to run to download the playbook, update the files, etc.

-	ssh azadmin@Jump-Box-Provisioner_ip
-	sudo docker container list -a | to locate your ansible container
-	sudo systemctl start docker && sudo docker start [name_of_the_container] && sudo docker attach [name_of_the_container] | start and attach or open your container
-	cd /etc/ansible/ | where the install-elk.yml file is located
-	ansible-playbook install-elk.yml | configures Elk-Server and starts the Elk container on the Elk-Server
-	cd /etc/ansible/roles | location of the filebeat-playbook.yml file
-	ansible-playbook filebeat-playbook.yml | installs Filebeat and Metricbeat
-	Open a new web browser and navigate to http://[Elk-Server_PublicIP]:5601. | This will bring up Kibana.
