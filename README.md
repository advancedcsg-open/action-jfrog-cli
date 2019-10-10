# GitHub Action for jFrog CLI for Artifactory

Runs all jFrog CLI commands for artifactory

## Usage

```yaml
on: push
name: Main Workflow
jobs:
  artifactoryUpload:
    name: Upload Trigger
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: build
      run: ./buildmyartifact.sh
    - name: publish to artifactory
      uses: advancedcsg-open/action-jfrog-cli@master
      env:
        URL: 'https://company.jfrog.io/'
        CRED: 'apikey'
        APIKEY: ${{ secrets.RT_APIKEY }}
      with:
        args: u "dist/*" "/mu/repo/path/" --recursive=true --build-name=myawesomeapp
```

## Secrets

You will need the following secrets based on how you authenticate to  Artifactory

### Username and Password
- `RT_USER`
- `RT_PASSWORD`

### API Key
- `RT_APIKEY`

### Access Token
- `RT_ACCESSTOKEN`

**Optionally**, you may want to store you URL as a secret too.

## Environment Variables

- `URL` - *Required* URL to your Artifactor instance
- `CRED`- *Required* Should be one of the `username`, `apikey` or `accesstoken`
- `USER`- *Conditionally Required* If `CRED` is set to `username` then this is required
- `PASSWORD`- *Conditionally Required* If `CRED` is set to `username` then this is required
- `APIKEY`- *Conditionally Required* If `CRED` is set to `apikey` then this is required
- `ACCESSTOKEN`- *Conditionally Required* If `CRED` is set to `accesstoken` then this is required


