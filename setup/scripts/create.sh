#!/bin/bash

sub="organization:$ORGANIZATION:project:$PROJECT:stack:*:deployment:*:operation:*"

cat <<EOF > payload.json
{
  "audiences": [
    "api://AzureADTokenExchange"
  ],
  "name": "hcp-terraform-flexible-credential",
  "issuer": "https://app.terraform.io",
  "claimsMatchingExpression": {
    "value": "claims['sub'] matches '$sub'",
    "languageVersion": 1
  }
}
EOF

az rest \
  --method post \
  --url "https://graph.microsoft.com/beta/applications/$OBJECT_ID/federatedIdentityCredentials" \
  --body @payload.json

rm payload.json
