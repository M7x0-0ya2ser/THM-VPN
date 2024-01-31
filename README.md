# THM-VPN

<details>
<summary>Before you start to use the tool if you aren't install cloudflare-warp follow the next steps</summary>
**1- Add cloudflare gpg key**
```bash
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
​````
```
**2- Add this repo to your apt repositories**
```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
​````
```
**3- Install**
```bash
sudo apt update && sudo apt install cloudflare-warp
​````
```
**4- run warp-svc**
```bash
warp-svc register&
​````
```
**5- register**
```bash
warp-cli register
​````
```
</details>
**6- connect**
```bash
warp-cli connect
​````
```
