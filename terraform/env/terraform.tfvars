project_id            = "your-project-id"
region                = "us-central1"
credentials_file      = "/path/to/credentials.json"
vpc_name              = "pg-bouncer"
subnet_name           = "pg-subnet"
subnet_cidr           = "10.0.0.0/24"
db_instance_name      = "pg-database"
region                = "us-central1"
project_id            = "your-project-id"
instance_name         = "pg-instance-gce"
instance_count        = 3
instance_machine_type = "n1-standard-1"
instance_zone         = "us-central1-a"
instance_tags         = ["allow-postgres"]
source_ranges         = ["0.0.0.0/0"]
source_tags           = ["allow-postgres"]
target_tags           = ["allow-postgres", "allow-http", "allow-https"]

