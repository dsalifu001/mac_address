#!/bin/bash

runSearch() {

    set -e

    apiKey=${API_KEY}

    if [ -z $1 ]
    then
        echo 'Invalid usage! Please enter a MAC address'
        exit 1
    fi

    url="https://api.macaddress.io/v1?apiKey=$apiKey&output=json&search=$1"
    result=$( curl -s "$url" )

    macAddress=$( echo $result | jq '.macAddressDetails.searchTerm' )
    isValid=$( echo $result | jq '.macAddressDetails.isValid' )
    companyName=$( echo $result | jq '.vendorDetails.companyName' )
    companyAddress=$( echo $result | jq '.vendorDetails.companyAddress' )

    if [ $isValid == 'true' ]
    then
        echo "This device with MAC Address: $macAddress was manufatured by $companyName located in $companyAddress"
    else
        echo "MAC Address: $macAddress is not valid"
    fi
}

runSearch $1    