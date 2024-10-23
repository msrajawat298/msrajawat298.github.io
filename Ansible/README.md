# Tutorial for Ansible in Hindi
- [Part 1 - Getting Started](https://www.youtube.com/watch?v=75wa1N49b-o&ab_channel=TechnicalGuftgu)
- [Part 2 - Ansible Playbooks](https://www.youtube.com/watch?v=kE-6KDyf-0o&ab_channel=TechnicalGuftgu)
- [Part 3 - Ansible Variables and Facts](https://www.youtube.com/watch?v=SR_CZcZQfqE&ab_channel=TechnicalGuftgu)
- [Part 4 - Ansible Loops and Conditions](https://www.youtube.com/watch?v=uyFrrKju4Es&t=5345s&ab_channel=TechnicalGuftgu)
- [Part 5 - Ansible Roles](https://www.youtube.com/watch?v=2UlTYJMi0YE&t=1251s&ab_channel=TechnicalGuftgu)
- [Ansible Tutorial for Beginners in english](https://youtu.be/MNGfPn0Yvs8?si=y0eZr8FF0fItleW1)

# Other Useful Resources
- [Ansible Official Documentation: The official documentation provides in-depth information about Ansible concepts, modules, and best practices.](https://docs.ansible.com)
- [Ansible Cheat Sheet: A handy cheat sheet with essential Ansible commands and concepts.](https://medium.com/edureka/ansible-cheat-sheet-guide-5fe615ad65c0)


# Useful commands use during Ansible setup
## Login node machine with the help of server machine without password

### Install SSH Command if not already installed
```sudo apt-get install openssh-server```

### Generating SSH Key
```ssh-keygen```

### Copy the SSH Key on the Hosts
```ssh-copy-id username@hostname or hostIP```

### Check the SSH Connection 
```ssh <nodeName> or <hostname or hostIP> # now it will not ask password to connect ssh```

- ```ansible --version```


- ```ansible all --list-hosts```
- ```ansible group-name --list-hosts```



### Ansible Basics:
- Ansible server OR Host
- Inventory
- Configuration
- Ad-Hoc Commands
- modules
- Notifier
- Handlers
- Playbooks
- Variables
- Loop
- Conditions
- Roles
- Task
- group-name
- Vault


# Lets start Understanding Ansible Fundamentals
- **Ansible Server or Host:** This is the machine where Ansible is installed, serving as the control center for executing tasks and playbooks. It is also referred to as the parent node, which manages all the child nodes or client servers.

- **Inventory:** The inventory is a list of managed nodes, organized into groups, that Ansible will work with. It defines where Ansible should execute tasks.
  - Location: `/etc/ansible/hosts` (default)
  - Define hosts and groups.

- **Configuration:** The configuration of Ansible involves settings and parameters to tailor its behavior. This includes specifying connection details, enabling or disabling certain features, and setting preferences.
  - Location: `/etc/ansible/ansible.cfg` (default)
  - Configure settings such as remote user, SSH private key, etc.

- **Ad-Hoc Commands (Simple Linux Commands):** Ad-Hoc commands are standalone commands that can be executed individually to perform quick functions. For instance, running commands like `ls`, `cat`, `touch`, `yum install`, or `apt-get install` on child nodes doesn't require creating a playbook. These commands are suitable for one-time usage and are not intended for configuration or automation management. 
  - **Ping:**
    ```ansible all -m ping```

  - **Run Command:**
    ```ansible <host/group> -a "<command>"```

  - **Copy File:**
    ```ansible <host/group> -m copy -a "src=<source> dest=<destination>"```
  ```bash
    How to run For example :

    [ansible@ip]$ ansible groupname -a "ls"
    [ansible@ip]$ ansible groupname -a "ls -la"
    [ansible@ip]$ ansible groupname -a "touch file1"
    [ansible@ip]$ ansible groupname -a "sudo yum install httpd -y"
    [ansible@ip]$ ansible groupname -ba "yum install httpd -y"

    # where -a mean argument and -b means became or acts as a sudo user
  ```
- **Module:** Module is a command or set of similar commands meant to be executed on the client-side.
  - Ansible ships with a number of modules called module library that can be executed directly on remote hosts or through playbooks.
  - its default path for the inventory file is  ```/etc/ansible/hosts```
  
  ```bash
  How to run module:
  
  [ansible@ip]$ ansible groupname -b -m yum -a "pkg=package name state=present"
  # State can be : "present" or "absent"
  # Package name : httpd, tree, python, php
  # -m for module

  [ansible@ip]$ ansible groupname -b -m copy -a "src=filepath dest=/destination-path"
  ```

- **Notifier:** The notifier in Ansible is a mechanism to trigger actions based on the status of tasks. It can be configured to send notifications or alerts upon task success or failure.

- **Handlers:** Handlers are special tasks that only run when called by other tasks. They are typically used for actions like restarting a service after a configuration change.

- **Playbooks:** Playbooks are files written in YAML format that define a set of tasks to be executed. They are central to Ansible's configuration management and automation capabilities.

- **Variables:** Variables allow you to store and reuse values throughout your Ansible playbooks, providing flexibility and dynamic configuration.

- **Loop:** Loops in Ansible enable the repetition of a task or set of tasks, iterating over a list of items.

- **Conditions:** Conditional statements in Ansible playbooks allow you to execute tasks based on certain criteria, enhancing the flexibility of automation.

- **Roles:** Roles are a way of organizing tasks, variables, and files in a structured format, making it easier to reuse and share configuration across different projects.

- **Task:** A task in Ansible is a single unit of work defined in a playbook. It represents a specific action to be taken on a target node.

- **Group Name:** Groups in Ansible allow you to organize and manage sets of hosts collectively, facilitating targeted execution of tasks on specific subsets of your infrastructure.

- **Vault:** Ansible Vault is a tool for encrypting sensitive information within playbooks, providing a secure way to manage secrets and sensitive data.
  These are Some useful command used to encrypt and decrypt playbooks files
  - Creating a new encrypted playbook : 
    ```ansible-vault create vault.yml```
  - Edit a new encrypted playbook : 
    ```ansible-vault edit vault.yml```
  - To change the password : 
    ```ansible-vault rekey vault.yml```
  - To encrypt an existing playbook : 
    ```ansible-vault encrypt vault.yml```
  - To Decrypt an existing playbook : 
    ```ansible-vault decrypt vault.yml```


## There are following examples of Playbooks


Example 1: create file playbooksetupserver.yml and run using this command ```ansible-playbook playbooksetupserver.yml```
```yaml
-- # MY PLAYBOOK
- hosts: groupname
  user: ansible
  become: yes
  connection: ssh
vars:
  pkgname: httpd
tasks:
  - name: install HTTPD server on centos 7
    action: yum name=' {{pkgname}}' state=present
```

Example 2: create file playbooksetupserver.yml and run using this command ```ansible-playbook playbookhandeler.yml```
```yaml
-- # MY Handler PLAYBOOK
- hosts: groupname
  user: ansible
  become: yes
  connection: ssh
vars:
  pkgname: httpd
tasks:
  - name: install HTTPD server on centos 7
    action: yum name=' {{pkgname}}' state=present
    notify: restart server
handler:
    - name: restart server
      action: service name=httpd state=restarted
```
If you want to check before running its your playbook correct or not you can do using dry run like this: ```ansible-playbook playbooksetupserver.yml --check```



- Loop :
Sometimes you want to repeat a task multiple times is called as loops in computer programming.
Ansible loops include changing the ownership on several files and/or directories with the file module, Creating multiple users with the user module, and repeated a polling step until certain result reached.


Example 3: create file playbooksetupserver.yml and run using this command ```ansible-playbook playbookloop.yml```
```yaml
-- # MY LOOPS PLAYBOOK
- hosts: groupname
  user: ansible
  become: yes
  connection: ssh
tasks:
  - name: add users in nodes
    user: name='{{item}}' state=present
    with_items:
            - Mayank
            - Pankaj
            - Sachin
```

- Conditions:
Whenever we have different different Scenario, we put conditions accordingly to the Scenario. such as sometime you have to skip particular commands on a particular nodes.

Example 4: create file playbooksetupserver.yml and run using this command ```ansible-playbook playbookloop.yml```
```yaml
-- # MY CONDITIONAL PLAYBOOK
- hosts: groupname
  user: ansible
  become: yes
  connection: ssh
tasks:
  - name: INSTALL APACHE Server for debian family
    command: apt-get install -y apache2
    when: ansible_os_family == "Debian"
  - name: INSTALL APACHE Server for redhat family
    command: yum -y install httpd
    when: ansible_os_family == "RedHat"
```

- Roles: A way of Organizing task a related files to be later called in playbooks.
- group-name: which is define inside the Inventory file means inside hosts file its a collection of child nodes basically it is an ip address.
like : developer is group name
[developer]
192.168.1.1
192.168.1.2
.
.
.
192.168.1.3


### Basic Structure Playbooks:

- **Basic Structure:**
  ```yaml
  ---
  - name: Playbook Name
    hosts: <host/group>
    tasks:
      - name: Task Name
        <module>: <parameters>
  ```

- **Run Playbook:**
  ```
  ansible-playbook <playbook.yml>
  ```

- **Variables:**
  - Define in playbooks or separate files.
  ```yaml
  ---
  vars:
    variable_name: value
  ```

- **Loops:**
  ```yaml
  ---
  tasks:
    - name: Task with Loop
      <module>:
        parameter: "{{ item }}"
      with_items:
        - value1
        - value2
  ```

- **Conditions:**
  ```yaml
  ---
  tasks:
    - name: Task with Condition
      <module>:
        parameter: value
      when: condition
  ```

- **Handlers:**
  - Define in the playbook to be notified by tasks.
  ```yaml
  ---
  handlers:
    - name: Restart Service
      <module>:
        name: service_name
      become: yes
  ```

### Roles:

- **Directory Structure:**
  ```
  roles/
    role_name/
      tasks/
        main.yml
      handlers/
        main.yml
      files/
      templates/
      vars/
        main.yml
      defaults/
        main.yml
      meta/
        main.yml
  ```

- **Include Role in Playbook:**
  ```yaml
  ---
  - name: Playbook with Role
    hosts: <host/group>
    roles:
      - role: role_name
  ```

### Ansible Galaxy:

- **Install Role:**
  ```
  ansible-galaxy install author_name.role_name
  ```

- **Init Role Structure:**
  ```
  ansible-galaxy init role_name
  ```

This is a basic cheat sheet, and Ansible has many more features and options. Refer to the official Ansible documentation for detailed information: [Ansible Documentation](https://docs.ansible.com/).