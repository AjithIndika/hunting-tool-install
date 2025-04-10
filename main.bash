1.subfinder -dL domain.txt  -all  -o subss.txt 
2.cat alldomain.txt | sort -u | httpx -silent -status-code -mc 200,301,302 | awk '{print $1}' > live_domains.txt      
3.subzy run --targets subss.txt
   3.1 echo "8648511.kiwi.com" | httpx -status-code -title -location -tech-detect
   3.2 dig domain.com
   2.3 curl -L 8648511.kiwi.com 

# namp san
nmap -A -p- -T4 -sV -O --script=default 151.101.2.58  

# Check DNS Resolution
nslookup temu-clone.example.com




#### python envirament Active 
python3 -m venv myenv
source myenv/bin/activate
 echo "webiosa.com"| httpx  -status-code -title -tech-detect 

dig url4192.kiwi.com A
dig url4192.kiwi.com AAAA
dig url4192.kiwi.com TXT

curl -I url4192.kiwi.com


subfinder -d example.com -o subdomains.txt
assetfinder --subs-only example.com >> subdomains.txt
aquatone -scan-timeout 10 -domain example.com -out results/
subjack -w subdomains.txt -t 50 -timeout 30 -ssl -v -o takeover_results.txt

nuclei -t subdomain-takeover -l subdomains.txt

#wayback 
cat live_domains.txt | waybackurls > temu-urls.txt


#dailfox
dalfox file  temu-urls.txt 

#web tech deact 
cat domains.txt | httpx -silent -status-code -title -tech-detect -o live_domains.txt


# Collect .js URLs and filter live ones
(cat urls.txt | gau ; cat urls.txt | waybackurls) | grep '\.js' | grep -Ev '\.json|\.map' | anew all-js.txt && cat all-js.txt | httpx -silent -mc 200 > live-js.txt


# JS crawling and endpoint discovery
cat live-js.txt | katana -silent -jsl -o katana-js-links.txt

#Workflow
(cat urls.txt | gau ; cat urls.txt | waybackurls) \
| grep '\.js' | grep -Ev '\.json|\.map' \
| anew all-js.txt \
&& cat all-js.txt | httpx -silent -mc 200 \
| anew live-js.txt \
&& cat live-js.txt | katana -silent -jsl -o katana-js-links.txt

#filter endpoints
cat katana-js-links.txt | gf endpoints > juicy.txt

#for XSS/fetch/ajax fun
cat katana-js-links.txt | grep -Ei 'fetch|xhr|ajax|api' > api-hints.txt

#cat js-endpoints.txt | dalfox pipe -o xss-checks.txt


 
