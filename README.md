# utils
Some utilities for building a dev machine using GCE.
This entire process was stolen from https://itnext.io/how-ive-slashed-the-cost-of-my-dev-environments-by-90-9c1082ad1baf
Go there and thank him.
## Usage
First create an IP address to attach to the VM (change the names however you want).
```bash
gcloud compute addresses create python-dev-machine-ip --project=dev-machine-323318 --network-tier=STANDARD --region=us-central1
```
Now make some firewall rules (these should stick around if you've already made them).
```bash
gcloud compute firewall-rules create allow-http --project=dev-machine323318 --direction=INGRESS --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server
gcloud compute firewall-rules create allow-https --project=dev-machine323318 --direction=INGRESS --network=default --action=ALLOW --rules=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https-server
```
Time to get the IP address and make the VM!
```bash
IP_ADDRESS_DEV_MACHINE=$(gcloud compute addresses list --filter="name:python-dev-machine-ip AND region:us-central1" --format="value(address_range())")
git clone https://github.com/Bryvo01/utils.git
cd utils
gcloud compute instances create python-dev-machine \
  --project=dev-machine-323318 \
  --zpne=us-central1-a \
  --machine-type=n1-standard-1 \
  --preemptible \
  --image=ubuntu-2004-focal-v20210820 \
  --boot-disk-size=10GB \
  --boot-disk-type=pd-standard \
  --boot-disk-device-name=python-dev-machine \
  --metadata-from-file startup-script=python-dev-machine.sh \
  --network-tier=STANDARD \
  --address=$IP_ADDRESS_DEV_MACHINE \
  --subnet=default \
  --tags=http-server,https-server \
  --labels=os=ubuntu-2004-lts,cost-allocation=development,usage=python,configuration=v1-0-0
  ```
  
  Connect to your machine through SSH by going to https://console.cloud.google.com/compute/instances and add your user account to the chrome-remote-desktop Linux group
  ```bash
  sudo usermod -a -G chrome-remote-desktop $USER
  logout
  ```
  
  Go to https://remotedesktop.google.com/headless and follow the instructions to add access to your VM.
  Access the remote VM through https://remotedesktop.google.com/access
