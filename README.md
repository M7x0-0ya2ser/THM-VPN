# THM-VPN


1- Add cloudflare gpg key <br/>
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg<br/>
​
2- Add this repo to your apt repositories<br/>
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list<br/>
​
3- Install<br/>
sudo apt update && sudo apt install cloudflare-warp<br/>
​
4- run warp-svc<br/>
warp-svc register&<br/>
​
5- register <br/>
warp-cli register<br/>
​
6- connect <br/>
warp-cli connect<br/>
