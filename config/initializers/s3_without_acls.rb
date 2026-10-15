# frozen_string_literal: true

# ActiveStorage asks for a "public-read" ACL on every upload to a public S3
# service. A bucket whose Object Ownership is "Bucket owner enforced" has ACLs
# disabled and rejects those uploads ("The bucket does not allow ACLs"); it
# makes its objects public through the bucket policy instead. Set
# AWS_ACLS_DISABLED=true for such a bucket to upload without the ACL and keep
# serving the same public URLs.
if Decidim::Env.new("AWS_ACLS_DISABLED").present?
  require "active_storage/service/s3_service"

  ActiveStorage::Service::S3Service.prepend(Module.new do
    def upload_options
      super.except(:acl)
    end
  end)
end
