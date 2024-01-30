# THM-VPN


setup process <br/>
steps:<br/>
Add cloudflare gpg key<br/>
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg<br/>
​
Add this repo to your apt repositories<br/>
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list<br/>
​
Install<br/>
sudo apt update && sudo apt install cloudflare-warp<br/>
​
run warp-svc<br/>
warp-svc register&<br/>
​
register <br/>
warp-cli register<br/>
​
connect <br/>
warp-cli connect<br/>
