require "refile/s3"

if Rails.env.production?
  aws = {
    access_key_id: ENV["AWS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_KEY"],
    region: ENV["AWS_REGION"],
    bucket: ENV["AWS_BUCKET"]
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
