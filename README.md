## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/diagram_andy.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk2.yml file may be used to install only certain pieces of it, such as Filebeat.


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

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the containers and system files.


The configuration details of each machine may be found below.

| Name        | Function   | IP Address | Operating System |
|-------------|------------|------------|------------------|
| vm-jump-box | Gateway    | 10.0.0.4   | Linux            |
| vm-web01    | Web Server | 10.0.0.5   | Linux            |
| vm-web02    | Web Server | 10.0.0.9   | Linux            |
| vm-web03    | Web Server | 10.0.0.7   | Linux            |
| Elk-VM      | Web Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the vm-jump-box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 76.198.232.54

Machines within the network can only be accessed by vm-jump-box (10.0.0.4).
- Elk-VM
- vm-web01
- vm-web02
- vm-web03

A summary of the access policies in place can be found in the table below.

| Name        | Publicy Accesible | Allowed IP Addresses |
|-------------|-------------------|----------------------|
| vm-jump-box | No                | 76.198.232.54        |
| Elk-VM      | No                | 76.198.232.54        |
| vm-web01    | No                | 10.0.0.4             |
| vm-web02    | No                | 10.0.0.4             |
| vm-web03    | No                | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this ensures that all configurations are compatible and are able to be reverted to the default state if needed.

The playbook implements the following tasks:
- Install Docker and Python
- Download an image of Elk
- Create and start an Elk container
- Increase virtual memory utilization to max

The following screenshot displays the result of running `sudo docker ps` after successfully configuring the ELK instance.

(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- vm-web01 / 10.0.0.5
- vm-web02 / 10.0.0.9
- vm-web03 / 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- 'Filebeat' collects all system logs, such as error messages, from the vm-web0X machines for analyzation within Kibana. 
- 'Metricbeat' collects system metrics, such as CPU utilization, from the DVWA docker containers.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk2.yml file to /etc/ansible.
- Update the /etc/ansible/hosts file, adding a new group for the Elk-VM IP address.
- Run the playbook, and navigate to http://<Elk-VM Public IP>:5601/app/kibana to check that the installation worked as expected.
