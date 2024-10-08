# Create Weaviate Secret if it does not exist
if oc get secret weaviate-api-key-secret >/dev/null 2>&1; then
  echo "Secret 'weaviate-api-key-secret' already exists
else
  # Create the secret
  oc create secret generic weaviate-api-key-secret \
    --from-literal=AUTHENTICATION_APIKEY_ALLOWED_KEYS="$(openssl rand -base64 32)"
  echo "Secret 'weaviate-api-key-secret' created
fi