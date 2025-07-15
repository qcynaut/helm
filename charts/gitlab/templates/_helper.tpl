{{- define "gitlab.objectstorage" -}}
provider: AWS
region: us-east-1
aws_access_key_id: {{ required "aws_access_key_id is required" .Values.s3.accessKey }}
aws_secret_access_key: {{ required "aws_secret_access_key is required" .Values.s3.secretKey | quote }}
aws_signature_version: 4
host: {{ required "host is required" .Values.s3.host }}
endpoint: {{ required "endpoint is required" .Values.s3.endpoint | quote }}
path_style: true
{{- end -}}

{{- define "gitlab.registrystorage" -}}
s3:
  v4auth: true
  regionendpoint: {{ required "regionendpoint is required" .Values.s3.endpoint | quote }}
  pathstyle: true
  region: us-east-1
  bucket: {{ required "bucket is required" .Values.s3.registry | quote }}
  accesskey: {{ required "accesskey is required" .Values.s3.accessKey }}
  secretkey: {{ required "secretkey is required" .Values.s3.secretKey | quote }}
{{- end -}}

{{- define "gitlab.s3cmdconfig" -}}
[default]
access_key = {{ required "access_key is required" .Values.s3.accessKey }}
access_token = 
add_encoding_exts = 
add_headers = 
bucket_location = us-east-1
ca_certs_file = 
cache_file = 
check_ssl_certificate = True
check_ssl_hostname = True
cloudfront_host = cloudfront.amazonaws.com
connection_max_age = 5
connection_pooling = True
content_disposition = 
content_type = 
default_mime_type = binary/octet-stream
delay_updates = False
delete_after = False
delete_after_fetch = False
delete_removed = False
dry_run = False
enable_multipart = True
encoding = UTF-8
encrypt = False
expiry_date = 
expiry_days = 
expiry_prefix = 
follow_symlinks = False
force = False
get_continue = False
gpg_command = None
gpg_decrypt = %(gpg_command)s -d --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s
gpg_encrypt = %(gpg_command)s -c --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s
gpg_passphrase = 
guess_mime_type = True
host_base = {{ required "host_base is required" .Values.s3.host }}
host_bucket = %(bucket)s.s3.amazonaws.com
human_readable_sizes = False
invalidate_default_index_on_cf = False
invalidate_default_index_root_on_cf = True
invalidate_on_cf = False
keep_dirs = False
kms_key = 
limit = -1
limitrate = 0
list_allow_unordered = False
list_md5 = False
log_target_prefix = 
long_listing = False
max_delete = -1
max_retries = 5
mime_type = 
multipart_chunk_size_mb = 15
multipart_copy_chunk_size_mb = 1024
multipart_max_chunks = 10000
preserve_attrs = True
progress_meter = True
proxy_host = 
proxy_port = 0
public_url_use_https = False
put_continue = False
recursive = False
recv_chunk = 65536
reduced_redundancy = False
requester_pays = False
restore_days = 1
restore_priority = Standard
secret_key = {{ required "secret_key is required" .Values.s3.secretKey }}
send_chunk = 65536
server_side_encryption = False
signature_v2 = False
signurl_use_https = False
simpledb_host = sdb.amazonaws.com
skip_destination_validation = False
skip_existing = False
socket_timeout = 300
ssl_client_cert_file = 
ssl_client_key_file = 
stats = False
stop_on_error = False
storage_class = 
throttle_max = 100
upload_id = 
urlencoding_mode = normal
use_http_expect = False
use_https = True
use_mime_magic = True
verbosity = WARNING
website_endpoint = http://%(bucket)s.s3-website-%(location)s.amazonaws.com/
website_error = 
website_index = index.html
{{- end -}}