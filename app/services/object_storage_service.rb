# app/services/object_storage_service.rb

class ObjectStorageService
  def self.upload_to_object_storage(formatted_content, object_name)
    begin
      # Configure AWS SDK
      Aws.config.update(region: 'ap-south-1', credentials: Aws::Credentials.new('redhat', 'redhat@123'))

      # Use Aws::S3::Client for more control; Aws::S3::Resource is high-level and uses Aws::S3::Client internally
      s3 = Aws::S3::Client.new

      # Specify bucket and object_key
      bucket_name = 'wiki'
      object_key = "#{Time.now.to_i}_#{object_name}"  # Use your preferred method here

      # Upload to S3
      s3.put_object(bucket: bucket_name, key: object_key, body: formatted_content)

      # Consider logging success message
      Rails.logger.info("Successfully uploaded #{object_name} to S3 bucket #{bucket_name} with key #{object_key}")
        
    rescue StandardError => e
      # Log the error and handle it appropriately
      Rails.logger.error("Error uploading to S3: #{e.message}")
      raise e  # Re-raise the exception to propagate it up the call stack
    end
  end

  def self.format_content(content)
    # Assuming Redmine::WikiFormatting.to_markdown is a valid method
    Redmine::WikiFormatting.to_markdown(content)
  end
end

