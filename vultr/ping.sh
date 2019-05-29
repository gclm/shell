#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#fonts color
Red="\033[31m" 
Font="\033[0m"
Blue="\033[36m"

echo -e "${Blue}Location: Frankfurt, DE${Font} "
ping -c 5 fra-de-ping.vultr.com	
 
echo -e "${Blue}Location: Paris, France ${version}${Font} "
ping -c 5 par-fr-ping.vultr.com	
 
echo -e "${Blue}Location: Amsterdam, NL${Font} "
ping -c 5 ams-nl-ping.vultr.com	
 
echo -e "${Blue}Location: London, UK${Font} "
ping -c 5 lon-gb-ping.vultr.com	
 
echo -e "${Blue}Location: Singapore${Font} "
ping -c 5 sgp-ping.vultr.com	
 
echo -e "${Blue}Location: New York (NJ)${Font} "
ping -c 5 nj-us-ping.vultr.com	
 
echo -e "${Blue}Location: Toronto, Canada${Font} "
ping -c 5 tor-ca-ping.vultr.com	
 
echo -e "${Blue}Location: Tokyo, Japan${Font} "
ping -c 5 hnd-jp-ping.vultr.com	
  
echo -e "${Blue}Location: Chicago, Illinois ${Font} "
ping -c 5 il-us-ping.vultr.com	
 
echo -e "${Blue}Location: Atlanta, Georgia ${Font} " 
ping -c 5 ga-us-ping.vultr.com	
  
echo -e "${Blue}Location: Miami, Florida${Font} "
ping -c 5 fl-us-ping.vultr.com	
  
echo -e "${Blue}Location: Seattle, Washington${Font} "
ping -c 5 wa-us-ping.vultr.com	
 
echo -e "${Blue}Location: Dallas, Texas ${Font} "
ping -c 5 tx-us-ping.vultr.com	
  
echo -e "${Blue}Location: Silicon Valley, California ${Font} "
ping -c 5 sjo-ca-us-ping.vultr.com	
  
echo -e "${Blue}Location: Los Angeles, California	${Font} "
ping -c 5 lax-ca-us-ping.vultr.com	
  
echo -e "${Blue}Location: Sydney, Australia ${version}${Font} "
ping -c 5 syd-au-ping.vultr.com	
 
echo -e "${Blue}Location: Sydney, Australia ${version}${Font} "
ping -c 5 fra-de-ping.vultr.com
