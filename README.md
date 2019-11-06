# GitHub Action for jFrog CLI for Artifactory

Runs all jFrog CLI commands for artifactory. This will prefix any arguments passed with `jfrog rt`.

## Usage

### Inputs

- `url` - *Required* URL to your Artifactor instance
- `credentials type`- *Required* Should be one of the `username`, `apikey` or `accesstoken`
- `user`- *Conditionally Required* If `credentials type` is set to `username` then this is required
- `password`- *Conditionally Required* If `credentials type` is set to `username` then this is required
- `apikey`- *Conditionally Required* If `credentials type` is set to `apikey` then this is required
- `access token`- *Conditionally Required* If `credentials type` is set to `accesstoken` then this is required
- `working directory` - *Optional* Speccify a directory to run the CLI from

### Example

```yaml
on: push
name: Main Workflow
jobs:
  artifactoryUpload:
    name: Upload Trigger
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1.2.0
    - name: build
      run: ./buildmyartifact.sh
    - name: publish to artifactory
      uses: advancedcsg-open/action-jfrog-cli@master
      with:
        url: 'https://company.jfrog.io/'
        credentials type: 'apikey'
        apikey: ${{ secrets.RT_APIKEY }}
        args: u "dist/*" "/mu/repo/path/" --recursive=true --build-name=myawesomeapp
```

## Recommended Secrets

You will need the following secrets based on how you authenticate to  Artifactory

### Username and Password
- `RT_USER`
- `RT_PASSWORD`

### API Key
- `RT_APIKEY`

### Access Token
- `RT_ACCESSTOKEN`

**Optionally**, you may want to store you URL as a secret too.
