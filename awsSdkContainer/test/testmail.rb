require 'aws-sdk'

# Replace sender@example.com with your "From" address.
# This address must be verified with Amazon SES.
sender = "no-reply@hoge.jp"

# Replace recipient@example.com with a "To" address. If your account 
# is still in the sandbox, this address must be verified.
recipient = "hirayama.tomohiro@hoge.jp"

# Specify a configuration set. If you do not want to use a configuration
# set, comment the following variable and the 
# configuration_set_name: configsetname argument below. 
# configsetname = "ConfigSet"
  
# Replace us-west-2 with the AWS Region you're using for Amazon SES.
awsregion = "us-east-1"

# The subject line for the email.
subject = "test"

# The HTML body of the email.
htmlbody = '<h1>日本語html</h1>'

# The email body for recipients with non-HTML email clients.  
textbody = "日本語テスト"

# Specify the text encoding scheme.
encoding = "UTF-8"

# Create a new SES resource and specify a region
ses = Aws::SES::Client.new(
    region: awsregion,
    access_key_id: '',
    secret_access_key: ''
)

# Try to send the email.
begin

  # Provide the contents of the email.
  resp = ses.send_email({
    destination: {
      to_addresses: [
        recipient,
      ],
    },
    message: {
      body: {
        html: {
          charset: encoding,
          data: htmlbody,
        },
        text: {
          charset: encoding,
          data: textbody,
        },
      },
      subject: {
        charset: encoding,
        data: subject,
      },
    },
  source: sender
  # Comment or remove the following line if you are not using 
  # a configuration set
  })
  puts "Email sent!"

# If something goes wrong, display an error message.
rescue Aws::SES::Errors::ServiceError => error
  puts "Email not sent. Error message: #{error}"

end