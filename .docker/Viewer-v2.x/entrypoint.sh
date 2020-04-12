#!/bin/bash

if [ -n "$CLIENT_ID" ] || [ -n "$HEALTHCARE_API_ENDPOINT" ]
  then
    # If CLIENT_ID is specified, use the google.js configuration with the modified ID
    if [ -n "$CLIENT_ID" ]
      then
  	    echo "Google Cloud Healthcare \$CLIENT_ID has been provided: "
  	    echo "$CLIENT_ID"
  	    echo "Updating config..."

  	    # - Use SED to replace the CLIENT_ID that is currently in google.js
	      sed -i -e "s/YOURCLIENTID.apps.googleusercontent.com/$CLIENT_ID/g" /usr/share/nginx/html/google.js
	  fi

    # If HEALTHCARE_API_ENDPOINT is specified, use the google.js configuration with the modified endpoint
    if [ -n "$HEALTHCARE_API_ENDPOINT" ]
      then
        echo "Google Cloud Healthcare \$HEALTHCARE_API_ENDPOINT has been provided: "
        echo "$HEALTHCARE_API_ENDPOINT"
        echo "Updating config..."

        # - Use SED to replace the HEALTHCARE_API_ENDPOINT that is currently in google.js
        sed -i -e "s+https://healthcare.googleapis.com/v1beta1+$HEALTHCARE_API_ENDPOINT+g" /usr/share/nginx/html/google.js
    fi

	  # - Copy google.js to overwrite app-config.js
	  cp /usr/share/nginx/html/google.js /usr/share/nginx/html/app-config.js
fi

EMPTY=""

if [ -n "$OSS_BUCKET" ]; then
    sed -i -e "s+<OSS_BUCKET>+$OSS_BUCKET+g" /usr/share/nginx/html/app-config.js
else
    sed -i -e "s+<OSS_BUCKET>+$EMPTY+g" /usr/share/nginx/html/app-config.js
fi

if [ -n "$OSS_REGION" ]; then
    sed -i -e "s+<OSS_REGION>+$OSS_REGION+g" /usr/share/nginx/html/app-config.js
else
    sed -i -e "s+<OSS_REGION>+$EMPTY+g" /usr/share/nginx/html/app-config.js
fi

if [ -n "$OSS_ACCESS_KEY_ID" ]; then
    sed -i -e "s+<OSS_ACCESS_KEY_ID>+$OSS_ACCESS_KEY_ID+g" /usr/share/nginx/html/app-config.js
else
    sed -i -e "s+<OSS_ACCESS_KEY_ID>+$EMPTY+g" /usr/share/nginx/html/app-config.js
fi

if [ -n "$OSS_ACCESS_KEY_SECRET" ]; then
    sed -i -e "s+<OSS_ACCESS_KEY_SECRET>+$OSS_ACCESS_KEY_SECRET+g" /usr/share/nginx/html/app-config.js
else
    sed -i -e "s+<OSS_ACCESS_KEY_SECRET>+$EMPTY+g" /usr/share/nginx/html/app-config.js
fi

echo "Starting Nginx to serve the OHIF Viewer..."

exec "$@"
