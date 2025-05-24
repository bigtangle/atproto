# Core service config
PDS_PORT=2583
PDS_HOSTNAME=localhost
PDS_PUBLIC_URL=http://localhost:2583
PDS_SERVICE_DID=did:example:pds
PDS_VERSION=0.0.0
PDS_DEV_MODE=true
PDS_INVITE_REQUIRED=false
# Secrets (required)
PDS_ADMIN_PASSWORD=admin-pass
PDS_JWT_SECRET=jwt-secret
PDS_PLC_ROTATION_KEY_K256_PRIVATE_KEY_HEX=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

# Identity service
PDS_DID_PLC_URL=http://localhost:2582

# Storage (choose one)
PDS_BLOBSTORE_DISK_LOCATION=./blobs

# Optional for debugging
NODE_ENV=development
DEBUG=*
