require 'json'
require 'aws-sdk'

def start_ec2(event:, context:)
  ec2 = Aws::EC2::Resource.new(region: 'ap-northeast-1')
  i = ec2.instance(ENV['INSTANCE_ID'])
  i.start
  { statusCode: 200, body: JSON.generate('OK') }
end

def stop_ec2(event:, context:)
  ec2 = Aws::EC2::Resource.new(region: 'ap-northeast-1')
  i = ec2.instance(ENV['INSTANCE_ID'])
  i.stop
  { statusCode: 200, body: JSON.generate('OK') }
end
