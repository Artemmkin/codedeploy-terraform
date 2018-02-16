## CodeDeploy with Terraform Demo

1. Generate an SSH key pair:

```bash
$ ssh-keygen -t rsa -f ~/.ssh/code-deploy-demo -C cd-demo -P ""
```

2. Run terraform:

  ```bash
  $ terraform init
  $ terraform apply
  ```
  Resources will be created in eu-west-1 region by default. Change `region` var if you want another region. 


3. From the output get the name of the s3 bucket created. If you get an output like this: 

  ```
  codedeploydemo-734.s3.amazonaws.com
  ```

  then the name of the created bucket is `codedeploydemo-734`. Save this bucket name, you will upload the sample application revision to that bucket.

4. Change directory into `sample-app`. And run the following command to create application revision and upload it to S3 bucket (make sure to change the name of the bucket). 

  ```
  $ cd sample-app
  $ aws deploy push \
      --application-name Sample_App \
      --s3-location s3://codedeploydemo-734/SampleApp.zip
  ```
  This command won't work if your current aws cli is not configured to work with the region specified in terraform. If it doesn't work make sure that default region in you aws configuration file is the same as the one specified in terraform.

  This command bundles the files from the current directory into a single archive file named SampleApp.zip, uploads the revision to the `codedeploydemo-734` bucket, and registers information with AWS CodeDeploy about the uploaded revision.

5. Create a deployment (make sure to change the name of the bucket):
  ```
  $ aws deploy create-deployment \
      --application-name Sample_App \
      --deployment-config-name CodeDeployDefault.OneAtATime \
      --deployment-group-name Sample_DepGroup \
      --s3-location bucket=codedeploydemo-734,bundleType=zip,key=SampleApp.zip
  ```
6. Access the Sample application by instace's public IP. Get the instance's public IP from terraform output and put it in your browser.
