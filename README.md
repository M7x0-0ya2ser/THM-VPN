# THM-VPN

![image](https://github.com/M7x0-0ya2ser/THM-VPN/assets/115821128/640dcfdb-212b-4b5e-a836-09c73a6c7e1e)

---

▶ Before you start to use the tool if you aren't install cloudflare-warp follow the next steps, if already installed skip the 6 next steps<br/>

---
**1- Add cloudflare gpg key**
```bash
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

```
**2- Add this repo to your apt repositories**
```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

```
**3- Install**
```bash
sudo apt update && sudo apt install cloudflare-warp

```
**4- run warp-svc**
```bash
warp-svc register&

```
**5- register**
```bash
warp-cli register

```
**6- connect**
```bash
warp-cli connect

```

---
▶ Before you start to use the tool if you aren't install openvpn follow the next steps, if already installed skip the next steps<br/>

```bash
1- sudo apt update
2- sudo apt install openvpn
```

---

