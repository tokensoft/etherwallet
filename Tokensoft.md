# Offline Execution

## Build the dist
```
npm install
npm run dist
```

## Add the certificate to trust for localhost
- Double click on certificate.pem in the main folder
- Click "Add" to Add to login keychain
- Search for the "localhost" cert you just installed
- Double click on it and choose "Always Trust" for SSL under Trust
- Close and save and enter pw to confirm

## Run the App
```
npm run localhost
```

Navigate to https://localhost:8080